Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2328626ejm;
        Tue, 2 May 2023 10:11:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5//1cG5aFlxBjo/8NXPG7/l0ynrRETxiuHRTchAxU5r1ChHXNMnVEXUfJC1PviXeofun89
X-Received: by 2002:a05:600c:2285:b0:3f1:7123:5f82 with SMTP id 5-20020a05600c228500b003f171235f82mr12162651wmf.12.1683047465948;
        Tue, 02 May 2023 10:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683047465; cv=none;
        d=google.com; s=arc-20160816;
        b=m4LIZAktexGt8ohQIPuENke75GrASOhtjkL6LEZY6dYbumwB5qGgan7aCnkB85wT6R
         GUrfuWg2K2DAPH7NwCUFh6Of30hBfXDrpNz3KvsW2HLeI6tOCgf76YhofnZZEBquT9tI
         W/NQ9757id1BuYiQ0NOBRUkEFZnm/tz10/X9GLuBoD816evIHu6Mm+d+KNeVCM97QjEI
         Ag3phgwAby9orza3p5S2gPmpiEkXIPpN4z7t8rl2mwfIP7fI3J6s7cWCNQpjivG9SyGH
         f8gn5diMkBqWQeATD/q/v9CmAOZBrnWovo2+mrv0zOutOvep1KTtIBHf+Gni7zA5XaBA
         ZEqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=v2x9Jn+7IZfHX2l5lIXRjchg57G90iMBytZFuAJ2o+E=;
        b=xcb6h2x2zA11CUFbq+5mHrjWvgX6QJQitCzireJzNNayDeE/MPLWJrnayDAeh78wWz
         Y+1WBI8kPgUeimI630wmVutnJT16nLPyDU+7Xd17Q8UB4fu0IBJhZpce9kAnuxVnuPpj
         q6aEezjUySZBE1yKNhw9COYoTpyjl75myBZzCJGnXLI1sECpW/UfAZJgFnVBwD8eop+s
         NUGav27lTK3K6O64AaZYE7hxgK2Sx5ziPFvF4ATuWlIYKsUpP9Rm3eha/DCSJjxIVO+T
         Q1jfiqK+VETE/0GWfXdnmy064yc6CsJUZbYj5CL8t4SU/8lGy+sgeOnc7AuhNYNfPvXe
         Yhmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=hAwIHVGT;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=NQ2HkeF0;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id m37-20020a05600c3b2500b003f322a05ca8si8079938wms.213.2023.05.02.10.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 10:11:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=hAwIHVGT;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=NQ2HkeF0;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 58FBF22019;
	Tue,  2 May 2023 17:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683047465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v2x9Jn+7IZfHX2l5lIXRjchg57G90iMBytZFuAJ2o+E=;
	b=hAwIHVGTly/kMN6hQifVA0IRTM+UfIrrwH143GEx85fQlApeeJtSE22xtzPIctmUlogLcK
	63GCulHxK1YegxYJftx81tt1Yl1vL7S5QZuRhVsdhUv6M852t8mB6bhd1ocM9iqAr0Lobg
	sFLOdH5Sj16/2SowCCMupZAs7m3dFJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683047465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v2x9Jn+7IZfHX2l5lIXRjchg57G90iMBytZFuAJ2o+E=;
	b=NQ2HkeF0arRc305F3t8XAFhuTiipF5XD1OigU1n7QydX1Sx8COebHp3VNfJzBoCYi4fz8s
	2nq1KqtzZcTMerCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D85F1139C3;
	Tue,  2 May 2023 17:11:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id C5fjJyhEUWSkVgAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 02 May 2023 17:11:04 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v11 00/13] target/arm: Allow CONFIG_TCG=n builds
In-Reply-To: <87o7n2itxm.fsf@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
 <CAFEAcA_ZVpZzuvZ71NzgweRC5Uti0T_fqG00paqDDe18QP-veQ@mail.gmail.com>
 <CAFEAcA-s6P2Y5nNQMyACeK3+4cuSrFfqqEdFW-BDToy_YXj64g@mail.gmail.com>
 <CAFEAcA-7ci6PRYCOcrPZcGq8x+Wxtx6wwSk1C18cOO=dXOq8Dw@mail.gmail.com>
 <87o7n2itxm.fsf@suse.de>
Date: Tue, 02 May 2023 14:11:02 -0300
Message-ID: <87lei6irq1.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: ycGexeJbpGmv

Fabiano Rosas <farosas@suse.de> writes:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On Tue, 2 May 2023 at 15:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> On Tue, 2 May 2023 at 10:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> >
>>> > On Wed, 26 Apr 2023 at 19:00, Fabiano Rosas <farosas@suse.de> wrote:
>>> > >
>>> > > Hi,
>>> > >
>>> > > Some minor changes:
>>> > >
>>> > > - new patch to move a test under CONFIG_TCG (broken on master);
>>> > > - new patch to document the unsupported CPU test (Philippe);
>>> > > - changed the test skip message when no KVM or TCG are present (Igor).
>>> >
>>> > Applied to target-arm.next; thanks for your persistence in
>>> > working through the many versions of this patchset.
>>>
>>> Update: I had to drop "gitlab-ci: Check building KVM-only aarch64 target"
>>> because it enables a CI job that fails on our aarch64 runner
>>> (because it wants to run tests using KVM but that machine
>>> isn't configured to allow the runner to use KVM).
>>
>> We fixed the runner config, but the CI still fails on that notcg
>> job because it is trying to run tests that explicitly use
>> '-accel tcg':
>> https://gitlab.com/qemu-project/qemu/-/jobs/4212850809#L3595
>>
>> Something is weird here, because we built without TCG support
>> on an aarch64 host but we still got qemu-system-i386
>> and qemu-system-x86_64 binaries, which then don't work
>> and cause the tests to fail...
>>
>
> Hmm, that's potentially due to Xen. Looks like we need more (!tcg &&
> !kvm) checks. Let me try to reproduce it.

Ah right, the test is skipped on my aarch64 host because I don't have
genisomage available. So what we need is this:

-- >8 --
From: Fabiano Rosas <farosas@suse.de>
Date: Tue, 2 May 2023 13:42:14 -0300
Subject: [PATCH] fixup! tests/qtest: Fix tests when no KVM or TCG are present

---
 tests/qtest/cdrom-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 26a2400181..09655e6ff0 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -205,6 +205,11 @@ int main(int argc, char **argv)
 
     g_test_init(&argc, &argv, NULL);
 
+    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
+        g_test_skip("No KVM or TCG accelerator available");
+        return 0;
+    }
+
     if (exec_genisoimg(genisocheck)) {
         /* genisoimage not available - so can't run tests */
         return g_test_run();
-- 
2.35.3
