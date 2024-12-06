Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp779856njb;
        Fri, 6 Dec 2024 03:43:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXhKsFFqM+6bCnwIHY2PmnfsJt8wdgLbEVP+i5Gyhd6CFei6kVoKfgdvPanUqIClbQICiPrYffSVUXkJw==@linaro.org
X-Received: by 2002:a05:6512:138a:b0:539:fb6f:cb8d with SMTP id 2adb3069b0e04-53e2c2c2110mr1363039e87.27.1733485403047;
        Fri, 06 Dec 2024 03:43:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733485403; cv=none;
        d=google.com; s=arc-20240605;
        b=P2aFXeFpBT50xDikN4O6B7dTWo2Ti6kxqQIJZNLP8KsRGZ4gWNvsL5hZj0xsbH9hyA
         e/o0bh6mep5C8PZ4jxNMmcXw4DJJ1us512ljXXZboPCb8A248Z6mWretk1VpiNBjj+Oh
         vB0n4gQpUtY4ZTLlcotDtyPglDVEbepddNSQThBFiiZq3sR9H7cQ7LqrdKWvIi2BqbOC
         qhPYGeHrQRtzDLtd8BH0IdAJX0bEo9zuYplbQvH+pDNZvzaQVKzE1WGsP3/BS7B8lf+t
         LlOWsfmH5vl5HSdXDBuV2KiTnWAR/paz60Tg1qAAYOG3RcZEDRcSV5FY2kSPysTejGug
         pnYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+dcZL/XycRcgJzs9PvbXJ58kkfyFPYjfcUspncSKoTQ=;
        fh=b1vZbmzqbxbkAotqeX9M1IH9Sey+te4XHowqcvyHT+s=;
        b=WWdzpwRfLzJ4kkBrbV0PnhUddvsFUw3gqOzbagLN+zQsqbHUi+YiZWiiLDTgfIjG4z
         wAZpFSWEnqgzH1Sz3ftdlsc6o+/TmAeddaSPqOb+dJ5Y7SL54Uri9mlTQ+1o6YQSEqiC
         WvTM2OSWAKGpsV4WXeBrHMMvpX5g0AKd3WitUnqM5cGZW+ojdY3oQg417AOdPh5RjznD
         w8jK3JeMwtw90sy6V3BAgLAQJL9BOIdcz/Q4Uzu0eeVr4GfFtvpyhvE4LxTvACQm0Vai
         XtZh6vys8Y3Z+fHaf4s1CbcXs6ul8gul7e+o5/4xbvkSMFFzI23Jxigs9skS7SIOdIuB
         bscg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e76MeBml;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-53e2297670bsor975708e87.11.2024.12.06.03.43.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Dec 2024 03:43:23 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e76MeBml;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733485402; x=1734090202; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dcZL/XycRcgJzs9PvbXJ58kkfyFPYjfcUspncSKoTQ=;
        b=e76MeBml03YVpzdj5ugbqXgRMffhjj2b61iiapD9xXjHV/9j+Y8X69axFQqTBiIkQ7
         wf9mOew5PmPqMiKsDHW0bvLxxesdRETsvvhSwsSRNemLo7kuRW4/uQw5i8IN9jL0Icpg
         WSKuo/QJTchw6dt+q/aAYZ4vugzXFyhMeXKidr2K0U5lF/lYy3c/2RQ3xj3/XJVgqxoa
         LHeWa2KJmkif7l2reWa/03aPxHRSipbSgWP3bK73awWofyRDIxVYB/0a8yhzMRK5c/ys
         S1FH+C2EFBu8Mj/YhMjbY0II/meraqBefdUjpZB5F4vekApyyc2d4SDGQiqI+gvJMfIk
         70fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733485402; x=1734090202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dcZL/XycRcgJzs9PvbXJ58kkfyFPYjfcUspncSKoTQ=;
        b=VbkZz+Zr4oKCIJ70cffg+zSFxSsCThfezkiSux9tBwVPgNZpNsouFfQrjAUYOugzIx
         LqauNiTgRP//1rKlct0YxIhl8czOGHZxN0BjdiQXqz+/YckcOZIII3vtpd6q+JKIq+ZB
         E4KY67ywK56GL1B0bPi+jzhMFtx/sTKq5MruZdbc294KOzXK4F+Ny+sV27/MsMDWdu8b
         OFtweBwAVlSyLlGCbxnPZ5NolXqUAg6a1m7OAcrEYPXrYgKGXeVf/DJ05S198PeT7grZ
         bOuOEqNQGqzMJiD39m69thCdzqL3NBvQfsCjr4eE0agHcPO7Kqy9qCcA0lnnffkD1dQf
         T7Cg==
X-Forwarded-Encrypted: i=1; AJvYcCX23zzbOQPW8j0BfL7PRgdwlh4BG7Xvh2i5lhHOTqtvs5wLwxXUwHfY9VrCH8J5R2Hd5I87iMkF0JSClg==@linaro.org
X-Gm-Message-State: AOJu0YxLdy4f4Oz620EZGim2jTx8789VEr/O6RnMUuUjvem0OWXDrzsp
	KjWn93xfeLXdN90TT8q7PjKiPvgGq3oM8OBkJ9DOh6STeveuRV9/zgdWkD45+0mA7n2l/4a7Syn
	QCYLgbtZ1tkKPLQCHRPrSABmhyrz+roqqtEWIjAsd
X-Gm-Gg: ASbGnctrqi1uRWBDx3QhCj1/v+SA1y1UMWT7fe2XnFdDlYmIPDMCeqTfE49wHZUmh03
	CV098jJ30QCcP3skQ48ekZ0CGkxCr9uR+
X-Google-Smtp-Source: AGHT+IHIMsEF1NNTn6NDxeq3XiOAvczc/SNBhNQysZE2mVj+n7tq6aX+P+1HxSrXc7i4YwTcqkQ+qPxFWkKwgsRwiuY=
X-Received: by 2002:a05:6512:ba8:b0:53d:eed0:8d9e with SMTP id
 2adb3069b0e04-53e2c2efb6amr1250862e87.53.1733485402383; Fri, 06 Dec 2024
 03:43:22 -0800 (PST)
MIME-Version: 1.0
References: <20241205222241.3789437-1-pierrick.bouvier@linaro.org>
 <20241205222241.3789437-3-pierrick.bouvier@linaro.org> <Z1LgpKB_J4Df4wcE@redhat.com>
In-Reply-To: <Z1LgpKB_J4Df4wcE@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 11:43:11 +0000
Message-ID: <CAFEAcA-WadSi-U+Q9MFY_+vhNimJ1HpCcSZE7aVz3PRKuwc+ew@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] docs/devel: add git-publish for patch submitting
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org, 
	Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, gustavo.romero@linaro.org, 
	Andrew Melnychenko <andrew@daynix.com>, qemu-arm@nongnu.org, alex.bennee@linaro.org, 
	Konstantin Kostiuk <kkostiuk@redhat.com>, Eric Blake <eblake@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Jason Wang <jasowang@redhat.com>, 
	Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, manos.pitsidianakis@linaro.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 8Lmu5oWSck7D

On Fri, 6 Dec 2024 at 11:32, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Thu, Dec 05, 2024 at 02:22:37PM -0800, Pierrick Bouvier wrote:
> > Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> > ---
> >  docs/devel/submitting-a-patch.rst | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-=
a-patch.rst
> > index 03b2ac298aa..f8b7fc59544 100644
> > --- a/docs/devel/submitting-a-patch.rst
> > +++ b/docs/devel/submitting-a-patch.rst
> > @@ -235,6 +235,25 @@ to another list.) ``git send-email`` (`step-by-ste=
p setup guide
> >  works best for delivering the patch without mangling it, but
> >  attachments can be used as a last resort on a first-time submission.
> >
> > +.. _use_git_publish:
> > +
> > +Use git-publish
> > +~~~~~~~~~~~~~~~
> > +
> > +If you already configured git send-email, you can simply use `git-publ=
ish
> > +<https://github.com/stefanha/git-publish>`__ to send series.
> > +
> > +::
> > +
> > +    $ git checkout master -b my-feature
> > +    $ # work on new commits, add your 'Signed-off-by' lines to each
> > +    $ git publish
> > +    $ ... more work, rebase on master, ...
> > +    $ git publish # will send a v2
> > +
> > +Each time you post a series, git-publish will create a local tag with =
the format
> > +``<branchname>-v<version>`` to record the patch series.
>
> Lets also mention
>
>   "When sending patch emails, 'git publish' will consult the output
>    of 'scripts/get_maintainers.pl' and automatically CC anyone listed
>    as maintainers of the affected code. Generally you should accept the
>    suggested CC list, but there may sometimes be scenarios where it is
>    appropriate to cut it down (eg on certain large tree-wide cleanups),
>    or augment it with other interested people"
>
> Second, lets say something about pull requests
>
>   "When a subsystem maintainer is ready to send a pull request, the
>    'git publish --pull' command will triggering GPG tag signing,
>    publish the branch to the git remote name specified by the
>    'remote.pushDefault' config option, and send the email series'

We don't do pull requests for the normal "end developer submits
a patch" process, and given the prevalence of the github/gitlab
"all contributions go in as pull requests" model, I think that
talking about pull requests here (except to say "we don't do them")
would be confusing. If we want to document how you can use git publish
for pull request submission we can do that in
docs/devel/submitting-a-pull-request.rst.

thanks
-- PMM
