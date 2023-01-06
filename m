Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id z14-20020a05600c220e00b003d99fad7511sm1722634wml.22.2023.01.06.05.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 05:48:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 50E0B1FFB7;
	Fri,  6 Jan 2023 13:48:50 +0000 (GMT)
References: <20230106132401.2544543-1-alex.bennee@linaro.org>
User-agent: mu4e 1.9.11; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] scripts/ci: update gitlab-runner playbook to use
 latest runner
Date: Fri, 06 Jan 2023 13:47:35 +0000
In-reply-to: <20230106132401.2544543-1-alex.bennee@linaro.org>
Message-ID: <87eds7pyd9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: qxqeKhl19nAf


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> We were using quite and old runner on our machines and running into
> issues with stalling jobs. Gitlab in the meantime now reliably provide
> the latest packaged versions of the runner under a stable URL. This
> update:
>
>   - creates a per-arch subdir for builds
>   - switches from binary tarballs to deb packages
>   - re-uses the same binary for the secondary runner
>   - updates distro check for second to 22.04
>
> So far I've tested on aarch64.ci.qemu.org but I shall do s390x next as
> its having issues with stale runners as well.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  scripts/ci/setup/gitlab-runner.yml | 42 ++++++++++++++++--------------
>  scripts/ci/setup/vars.yml.template |  2 --
>  2 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab=
-runner.yml
> index 33128be85d..05cdb2ae4b 100644
> --- a/scripts/ci/setup/gitlab-runner.yml
> +++ b/scripts/ci/setup/gitlab-runner.yml
> @@ -30,6 +30,11 @@
>          home: /home/gitlab-runner
>          shell: /bin/bash
>=20=20
> +    - name: Create working directories for build
> +      file:
> +        path: "/home/gitlab-runner/{{ ansible_facts[\"architecture\"] }}"
> +        state: directory
> +
>      - name: Remove the .bash_logout file when on Ubuntu systems
>        file:
>          path: /home/gitlab-runner/.bash_logout
> @@ -50,17 +55,17 @@
>=20=20
>      - name: Download the matching gitlab-runner
>        get_url:
> -        dest: /usr/local/bin/gitlab-runner
> -        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitla=
b_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-{{ gitla=
b_runner_arch }}"
> -        owner: gitlab-runner
> -        group: gitlab-runner
> -        mode: u=3Drwx,g=3Drwx,o=3Drx
> +        dest: "/root/"
> +        url: "https://gitlab-runner-downloads.s3.amazonaws.com/latest/de=
b/gitlab-runner_{{ gitlab_runner_arch }}.deb"
> +
> +    - name: Install gitlab-runner via package manager
> +      apt: deb=3D"/root/gitlab-runner_{{ gitlab_runner_arch }}.deb"
>=20=20
>      - name: Register the gitlab-runner
> -      command: "/usr/local/bin/gitlab-runner register --non-interactive =
--url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_=
registration_token }} --executor shell --tag-list {{ ansible_facts[\"archit=
ecture\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\=
"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\=
"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"arch=
itecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
> +      command: "/usr/bin/gitlab-runner register --non-interactive --url =
{{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_regist=
ration_token }} --executor shell --tag-list {{ ansible_facts[\"architecture=
\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distr=
ibution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} =
{{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architectu=
re\"] }} ({{ ansible_facts[\"os_family\"] }})'"
>=20=20
>      - name: Install the gitlab-runner service using its own functionality
> -      command: /usr/local/bin/gitlab-runner install --user gitlab-runner=
 --working-directory /home/gitlab-runner
> +      command: "/usr/bin/gitlab-runner install --user gitlab-runner --wo=
rking-directory /home/gitlab-runner/{{ ansible_facts[\"architecture\"] }}"
>        register: gitlab_runner_install_service_result
>        failed_when: "gitlab_runner_install_service_result.rc !=3D 0 and \=
"already exists\" not in gitlab_runner_install_service_result.stderr"
>=20=20
> @@ -70,33 +75,30 @@
>          state: started
>          enabled: yes
>=20=20
> -    - name: Download secondary gitlab-runner
> -      get_url:
> -        dest: /usr/local/bin/gitlab-runner-arm
> -        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitla=
b_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-arm"
> -        owner: gitlab-runner
> -        group: gitlab-runner
> -        mode: u=3Drwx,g=3Drwx,o=3Drx
> +    - name: Create working directories secondary runner
> +      file:
> +        path: "/home/gitlab-runner/arm"
> +        state: directory
>        when:
>          - ansible_facts['distribution'] =3D=3D 'Ubuntu'
>          - ansible_facts['architecture'] =3D=3D 'aarch64'
> -        - ansible_facts['distribution_version'] =3D=3D '20.04'
> +        - ansible_facts['distribution_version'] =3D=3D '22.04'
>=20=20
>      - name: Register secondary gitlab-runner
> -      command: "/usr/local/bin/gitlab-runner-arm register --non-interact=
ive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_run=
ner_registration_token }} --executor shell --tag-list aarch32,{{ ansible_fa=
cts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }=
} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"d=
istribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible=
_facts[\"os_family\"] }})'"
> +      command: "/usr/bin/gitlab-runner register --non-interactive --url =
{{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_regist=
ration_token }} --executor shell --tag-list aarch32,{{ ansible_facts[\"dist=
ribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --descri=
ption '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distributio=
n_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"o=
s_family\"] }})'"
>        when:
>          - ansible_facts['distribution'] =3D=3D 'Ubuntu'
>          - ansible_facts['architecture'] =3D=3D 'aarch64'
> -        - ansible_facts['distribution_version'] =3D=3D '20.04'
> +        - ansible_facts['distribution_version'] =3D=3D '22.04'

  I think everything bellow here can be dropped now as both runners seem
  to be showing the same runner ids:

  13:42:48 [root@aarch64:/e/systemd] + systemctl status gitlab-runner-arm
  =E2=97=8F gitlab-runner-arm.service - GitLab Runner
       Loaded: loaded (/etc/systemd/system/gitlab-runner-arm.service; enabl=
ed; vendor preset: enabled)
       Active: active (running) since Fri 2023-01-06 13:42:45 UTC; 9s ago
     Main PID: 38362 (gitlab-runner)
        Tasks: 33 (limit: 307985)
       Memory: 16.0M
          CPU: 81ms
       CGroup: /system.slice/gitlab-runner-arm.service
               =E2=94=94=E2=94=8038362 /usr/bin/gitlab-runner run --working=
-directory /home/gitlab-runner/arm --config /etc/gitlab-runner/config.toml =
--service gitlab-runner-arm --user gitla>

  Jan 06 13:42:45 aarch64.ci.qemu.org gitlab-runner[38362]: Running in syst=
em-mode.=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
  Jan 06 13:42:45 aarch64.ci.qemu.org gitlab-runner[38362]:=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Jan 06 13:42:45 aarch64.ci.qemu.org gitlab-runner[38362]: Configuration l=
oaded                                builds=3D0
  Jan 06 13:42:45 aarch64.ci.qemu.org gitlab-runner[38362]: listen_address =
not defined, metrics & debug endpoints disabled  builds=3D0
  Jan 06 13:42:45 aarch64.ci.qemu.org gitlab-runner[38362]: [session_server=
].listen_address not defined, session endpoints disabled  builds=3D0
  Jan 06 13:42:45 aarch64.ci.qemu.org gitlab-runner[38362]: Initializing ex=
ecutor providers                     builds=3D0
  Jan 06 13:42:45 aarch64.ci.qemu.org gitlab-runner[38362]: Checking for jo=
bs...nothing                         runner=3DHXc1tXPb
  Jan 06 13:42:46 aarch64.ci.qemu.org gitlab-runner[38362]: Checking for jo=
bs...nothing                         runner=3DpwrzaBKo
  Jan 06 13:42:47 aarch64.ci.qemu.org gitlab-runner[38362]: Checking for jo=
bs...nothing                         runner=3DE8PpwMky
  Jan 06 13:42:47 aarch64.ci.qemu.org gitlab-runner[38362]: Checking for jo=
bs...nothing                         runner=3DsyqX1xoo
  13:43:06 [root@aarch64:/e/systemd] + systemctl status gitlab-runner
  =E2=97=8F gitlab-runner.service - GitLab Runner
       Loaded: loaded (/etc/systemd/system/gitlab-runner.service; enabled; =
vendor preset: enabled)
       Active: active (running) since Fri 2023-01-06 13:42:42 UTC; 28s ago
     Main PID: 38270 (gitlab-runner)
        Tasks: 27 (limit: 307985)
       Memory: 14.3M
          CPU: 70ms
       CGroup: /system.slice/gitlab-runner.service
               =E2=94=94=E2=94=8038270 /usr/bin/gitlab-runner run --working=
-directory /home/gitlab-runner --config /etc/gitlab-runner/config.toml --se=
rvice gitlab-runner --user gitlab-runner

  Jan 06 13:42:42 aarch64.ci.qemu.org gitlab-runner[38270]: Running in syst=
em-mode.=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
  Jan 06 13:42:42 aarch64.ci.qemu.org gitlab-runner[38270]:=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Jan 06 13:42:42 aarch64.ci.qemu.org gitlab-runner[38270]: Configuration l=
oaded                                builds=3D0
  Jan 06 13:42:42 aarch64.ci.qemu.org gitlab-runner[38270]: listen_address =
not defined, metrics & debug endpoints disabled  builds=3D0
  Jan 06 13:42:42 aarch64.ci.qemu.org gitlab-runner[38270]: [session_server=
].listen_address not defined, session endpoints disabled  builds=3D0
  Jan 06 13:42:42 aarch64.ci.qemu.org gitlab-runner[38270]: Initializing ex=
ecutor providers                     builds=3D0
  Jan 06 13:42:43 aarch64.ci.qemu.org gitlab-runner[38270]: Checking for jo=
bs...nothing                         runner=3DHXc1tXPb
  Jan 06 13:42:43 aarch64.ci.qemu.org gitlab-runner[38270]: Checking for jo=
bs...nothing                         runner=3DpwrzaBKo
  Jan 06 13:42:44 aarch64.ci.qemu.org gitlab-runner[38270]: Checking for jo=
bs...nothing                         runner=3DE8PpwMky
  Jan 06 13:42:45 aarch64.ci.qemu.org gitlab-runner[38270]: Checking for jo=
bs...nothing                         runner=3DsyqX1xoo



--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
