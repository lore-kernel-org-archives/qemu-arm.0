Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493ee14sm1534556f8f.99.2024.11.20.01.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 01:51:28 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BFD405F8C1;
	Wed, 20 Nov 2024 09:51:27 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
  qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Richard Henderson <richard.henderson@linaro.org>,  Andrew Melnychenko
 <andrew@daynix.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Jason
 Wang <jasowang@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  Fabiano Rosas
 <farosas@suse.de>,  Kevin Wolf <kwolf@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Eric Blake <eblake@redhat.com>,
  qemu-arm@nongnu.org,  Yuri Benditovich <yuri.benditovich@daynix.com>,
  manos.pitsidianakis@linaro.org,  qemu-block@nongnu.org,  Michael Roth
 <michael.roth@amd.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Peter Xu <peterx@redhat.com>,
  gustavo.romero@linaro.org,  Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/7] docs/devel: add git-publish for patch submitting
In-Reply-To: <b9df48b7-c1a9-4a46-bd78-b7ecb8328b33@linaro.org> (Pierrick
	Bouvier's message of "Tue, 19 Nov 2024 22:25:37 -0800")
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
	<20241118172357.475281-3-pierrick.bouvier@linaro.org>
	<ce090d62-89a8-4f1a-a864-add24704dd11@linaro.org>
	<b9df48b7-c1a9-4a46-bd78-b7ecb8328b33@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 20 Nov 2024 09:51:27 +0000
Message-ID: <875xoinsgw.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: WLCJFicL79bx

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> On 11/19/24 00:41, Marcin Juszkiewicz wrote:
>> W dniu 18.11.2024 o=C2=A018:23, Pierrick Bouvier pisze:
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    docs/devel/submitting-a-patch.rst | 14 ++++++++++++++
>>>    1 file changed, 14 insertions(+)
>>>
>>> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-=
a-patch.rst
>>> index 349c32ee3a9..953682f20cb 100644
>>> --- a/docs/devel/submitting-a-patch.rst
>>> +++ b/docs/devel/submitting-a-patch.rst
>>> @@ -237,6 +237,20 @@ attachments can be used as a last resort on a firs=
t-time submission.
>>>       .. _if_you_cannot_send_patch_emails:
>>>    +Use git-publish
>>> +~~~~~~~~~~~~~~~
>>> +
>>> +If you already configured git send-email, you can simply use `git-publ=
ish
>>> +<https://github.com/stefanha/git-publish>`__ to send series.
>>> +
>>> +::
>>> +
>>> +    $ git checkout master -b my-feature
>>> +    $ # work on new commits, add your 'Signed-off-by' lines to each
>>> +    $ git publish
>>> +    $ ... more work, rebase on master, ...
>>> +    $ git publish # will send a v2
>> You recommend 'b4 shazam' in 3/7 patch so why not here? Both 'b4'
>> and
>> 'git-publish' seem to do same stuff - handle patch series and send them
>> upstream.
>>
>
> Are you using b4 for your QEMU contributions?
>
> When I started working on QEMU, I tried it before git-publish and had
> an error when trying to send my series. I don't remember exactly what
> it was, but something related to finding the reviewers for a given
> commit. When I asked, team members pointed me towards git-publish.

I tend to use b4 to apply patches because it works well with the
archives and collects together the tags for you. I have not used it to
publish patches to the list.

My sending workflow used done manually (rather via my carefully
customised Emacs org workflow) but now I just use git publish to send
series to the list. I still occasionally use git send-email directly for
sending individual patches with something like:

  git send-email --subject-prefix=3D"RFC PATCH" --to qemu HEAD^..

I still send pull requests by hand:

  git send-email --confirm=3Dnever --quiet ${mailto} ${series}.pull/*

but thats probably because I haven't figured out the steps for git
publish to do that.

Anyway tldr; b4 to apply *from* list, git publish to send *to* list.

>
>> b4 allows to keep To/Cc emails inside of cover letter which makes it
>> easy to not miss anyone needed.
>
> git-publish works pretty well for me, and does what you expect (keep
> your cover letter/cc and track your versions).

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
