Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5607848ejc;
        Tue, 28 Feb 2023 02:38:32 -0800 (PST)
X-Google-Smtp-Source: AK7set/RolF7Xr4vu4A8hP6pIBOSpIalJkG5oyyNaonTqe7/GvJnYEsoF4KdNydvPL8RDw0tcMI1
X-Received: by 2002:ac8:4904:0:b0:3ba:2b4:7b39 with SMTP id e4-20020ac84904000000b003ba02b47b39mr2799890qtq.46.1677580712082;
        Tue, 28 Feb 2023 02:38:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677580712; cv=none;
        d=google.com; s=arc-20160816;
        b=XreefyLFzhQ13L1uG5VsZ6MTpV7DJ559H6sPVpb8FqoF3zbmrcHlEC40+p1/SoS6sl
         g/smnI+hqBJdLPq3I+tHY6AMelvnq3VAnTVz7LjHppxC6jhaKp70ACf2GJMRDfaK7c5A
         JNGgkMPuPQIr/Nldh5lxmIIN9apkSinvtEZh7gfJ+/y4WGuqUm/nacxItjOP8BhcHSNy
         pfjX5C29zg5eL8T7ZAgufkIBEEMIFU9MXssfaRvihVdjiP2/CkvecJhR5lRu6VcN+XCX
         63Jixi/OgMQScg/qXhc4K+9LlKDMC1Yts4XvBe994HUeVG70JjoMpdkEO8mcPy6miFny
         oLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=oEgNSVxFzIXU0kN/Ma+tLlR7sRWE/MFBauqEp+e7ZGE=;
        b=B6gUB6ibGrSQfl100uT93Yzg5s4vNXQgFqFkzpHiT5K3knU7SyXFzHXwxeUhLZz3ea
         0+meAgULJukVlkdmvKsmaid/cce2PQtPNHNa8l+TwCbW+lRbJeXf0WrYhWiW8e2/eufe
         vAcZEu5Af+uIywufMIgB1KorMY4040ixeS0s39YrRgG9WzwzPqHurDz4AU+aCJX5gwTF
         R6TlLjXvSi2QqA+jyjVQxvyi5TFT5/CVvcRJU4dc/6O/2w0Zy03A9HC9X4phtOsO/0KM
         XCXkARj//0l0zKbEgPrKFkgg01rQxLwNbnAET10LD9NCAcr8RwIY1PAHEDGxjwLl1GkE
         Sm9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TljR0Lp3;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id y16-20020a05622a165000b003bfef95515bsi319126qtj.51.2023.02.28.02.38.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 02:38:32 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TljR0Lp3;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677580711;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oEgNSVxFzIXU0kN/Ma+tLlR7sRWE/MFBauqEp+e7ZGE=;
	b=TljR0Lp39hcp87763ZMGZhK7+uE0hogRj1shRn+TVaSB33WedLZ0xqlEeE7nHUOXRjPjQ2
	ni4bClyYQTJ9Adqi0HRikJ2EnMEKLBilX6Uvnv79/8NEnJLfkZHXZn5s/rfotCjKU6K78o
	wgJReXAQxACOIlKf2J9L+T7wVDDOL+0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-Iu5r7JQrN_Sf8_GM_dAkvQ-1; Tue, 28 Feb 2023 05:38:28 -0500
X-MC-Unique: Iu5r7JQrN_Sf8_GM_dAkvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49627800B23;
	Tue, 28 Feb 2023 10:38:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2B7A1121318;
	Tue, 28 Feb 2023 10:38:22 +0000 (UTC)
Date: Tue, 28 Feb 2023 10:38:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>, Ed Maste <emaste@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-block@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	John Snow <jsnow@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
	Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: Re: [PATCH 3/7] tests/lcitool: append user setting stanza to
 dockerfiles
Message-ID: <Y/3ZnMeOFKD7rNSy@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-4-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230224180857.1050220-4-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: BgFX/+Pf7W/H

On Fri, Feb 24, 2023 at 06:08:53PM +0000, Alex Bennée wrote:
> For the cross-compilation use-case it is important to add the host
> user to the dockerfile so we can map them to the docker environment
> when cross-building files.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/cirrus/freebsd-12.vars                   |  5 +++++
>  .gitlab-ci.d/cirrus/freebsd-13.vars                   |  5 +++++
>  .gitlab-ci.d/cirrus/macos-12.vars                     |  5 +++++
>  tests/docker/dockerfiles/alpine.docker                |  5 +++++
>  tests/docker/dockerfiles/centos8.docker               |  5 +++++
>  tests/docker/dockerfiles/debian-amd64-cross.docker    |  5 +++++
>  tests/docker/dockerfiles/debian-amd64.docker          |  5 +++++
>  tests/docker/dockerfiles/debian-arm64-cross.docker    |  5 +++++
>  tests/docker/dockerfiles/debian-armel-cross.docker    |  5 +++++
>  tests/docker/dockerfiles/debian-armhf-cross.docker    |  5 +++++
>  tests/docker/dockerfiles/debian-mips64el-cross.docker |  5 +++++
>  tests/docker/dockerfiles/debian-mipsel-cross.docker   |  5 +++++
>  tests/docker/dockerfiles/debian-ppc64el-cross.docker  |  5 +++++
>  tests/docker/dockerfiles/debian-s390x-cross.docker    |  5 +++++
>  tests/docker/dockerfiles/fedora-win32-cross.docker    |  5 +++++
>  tests/docker/dockerfiles/fedora-win64-cross.docker    |  5 +++++
>  tests/docker/dockerfiles/fedora.docker                |  5 +++++
>  tests/docker/dockerfiles/opensuse-leap.docker         |  5 +++++
>  tests/docker/dockerfiles/ubuntu2004.docker            |  5 +++++
>  tests/docker/dockerfiles/ubuntu2204.docker            |  5 +++++
>  tests/lcitool/refresh                                 | 11 ++++++++++-
>  21 files changed, 110 insertions(+), 1 deletion(-)


> 
> diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
> index 44d8a2a511..0bff53be44 100644
> --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
> +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
> @@ -14,3 +14,8 @@ PIP3='/usr/local/bin/pip-3.8'
>  PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 zstd'
>  PYPI_PKGS=''
>  PYTHON='/usr/local/bin/python3'
> +# As a final step configure the user (if env is defined)
> +ARG USER
> +ARG UID
> +RUN if [ "${USER}" ]; then \
> +  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
> \ No newline at end of file

The cirrus/*.vars files aren't dockerfiles, they're shell
scripts, so don't modify them


> diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
> index 56cf14e553..7b82dec8e5 100644
> --- a/tests/docker/dockerfiles/alpine.docker
> +++ b/tests/docker/dockerfiles/alpine.docker
> @@ -124,3 +124,8 @@ ENV LANG "en_US.UTF-8"
>  ENV MAKE "/usr/bin/make"
>  ENV NINJA "/usr/bin/ninja"
>  ENV PYTHON "/usr/bin/python3"
> +# As a final step configure the user (if env is defined)
> +ARG USER
> +ARG UID
> +RUN if [ "${USER}" ]; then \
> +  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
> \ No newline at end of file

Add a trailing newline to these perhaps ?


> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index cc9e34ac87..88bf33fb74 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -40,6 +40,15 @@ def atomic_write(filename, content):
>          tmp.unlink()
>          raise
>  
> +# Optional user setting, this will always be the last thing added
> +# so maximise the number of layers that are cached
> +add_user_mapping = [
> +    "# As a final step configure the user (if env is defined)",
> +    "ARG USER",
> +    "ARG UID",
> +    "RUN if [ \"${USER}\" ]; then \\",
> +    "  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi"
> +]
>  
>  def generate(filename, cmd, trailer):
>      print("Generate %s" % filename)
> @@ -51,9 +60,9 @@ def generate(filename, cmd, trailer):
>      content = lcitool.stdout.decode("utf8")
>      if trailer is not None:
>          content += trailer
> +    content += "\n".join(add_user_mapping)

  if filename.endswith(".docker"):
       content += "\n".join(add_user_mapping)

to avoid splattering the cirrus vars files


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
