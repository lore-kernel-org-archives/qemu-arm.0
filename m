Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3102CCA5FA1
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 01:36:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBMlZ-0003An-8I; Mon, 28 Sep 2026 21:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBMlX-0003AA-HW
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 21:36:19 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBMlU-00070Q-VU
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 21:36:19 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6aaf28a86b9so930226a12.1
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 18:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790645775; cv=none;
 d=google.com; s=arc-20260327;
 b=rNKYSBtF7gKUPL9dyWwsVXwJ95WSkmo4sYWrowUlY4IbUqOKnTeNycx/XBNFxZQZvF
 Bv94qb0gjHZxkc49vAx1nuwc1Qzhc92JNRSnnO00ON3TY0vU+pz2UkQGkMnwysNU8a8/
 4zhvmO6a8QB5JPlN6iy3oC9JhMZNWwZDtlKc1DmdXlpOhAp0S0GWLHORPSUtWsRjVbP9
 9lEyg8SR/IcyJ/sUQpIbhYuU7KAseTuqG6AvgbORxIyIuZFLpiTBR1vfNmgwUi9Tg1hE
 TicOVmCD6YerYgoZAvqU2cnTj4UaT1BqTJllYnn1wGlQkHeUmpHThRlKSjDoMwOgLIbi
 Zoww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=rs9au1eGA9M7SYgh5SPNLTgJY2xqQlWh6Et+Arr6MM0=;
 fh=s/ubOcp6TJCj24o41lxFOYc4RlFXTlNZ8RDJbZKyCnY=;
 b=f5L27v0NndJXnz3DWZjq6Gh24tWEXEAvNMBJaDIfUWZAXn8+i0vLOIFoYI90n4mu9V
 puiXRR9PLoKeo8bd+amqPpgMJIJZTd9afyfU/9I6R5OUc3bV4q8oPvoCKfjgdossj1HB
 WjYdq+njEVkHolJvrL1p0IqA9jixVclM+UZktR1IyDIZkUrWoZQwYRAViZdx7eXlKpHy
 wWpJAcTNILSG/MAPgWiEzH+khtirNtPJQ8CPMpXjs3TAI7lEwzCnruwBDhzLRzSP0Cv4
 WkAXq/fxiuzuAntMmMCyAKBuK7AfgAQzytpzqd3uNFXqGU1/ODNjqy1hmIq5m1Whgl4p
 vLGw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790645775; x=1791250575; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=rs9au1eGA9M7SYgh5SPNLTgJY2xqQlWh6Et+Arr6MM0=;
 b=TxvsfGw9ZfLJ4LSdn/ER5Fs+mtsywNNUruBZLjQWN0g+ZYKV2+nIzfPxVcUplFKo5c
 iteDccaeompSd+s3fI/YSNcLcKdXBHCzFgaffr58yhKcj1CaHDlI2av6ThaM5bh4ON00
 9omUD+l6aQzHraDvJBJ/z9jJkwtLHtp2OGBtS+Dd5NKluOnlHEM5UBscnXELrZGqk4wI
 JBcKsR0canbjRZcy20Lfge8AkLYKp9ytHCwWInuFUSqKWQVqzMiHpin3I0OO5+jio4zZ
 Ov1jJw8sVfBgaqwf46HdNuU3mEBSqyX9uD8ff0KOti31+4vQcAGY2WU9rNVPKiALzU5S
 MNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790645775; x=1791250575;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rs9au1eGA9M7SYgh5SPNLTgJY2xqQlWh6Et+Arr6MM0=;
 b=REkUgAC8vflEQbSCkHs2cKmt7aMepeOiUNCZkL5CxGbgg0tk+4kt+EJLQyHfchDpYY
 LSs51L9tE5pPOM0FP1WIMcIPJXjPeCNx4N0Q660OKrtPAGGH7fDIUMsdICMucvNv0P3I
 huiSEb1NQFrKEnyruoBYqfvSwqKNnOFgMWph08pJsQu+XQvz44247nxs9INW2P4I8pNU
 Jm2zOxVWIty8zjyQFZ4YNFcjUvZywiOse8c0uCWgeuFzzs9FdWir0YolFHWjIplfox4/
 7gbwJlP+6A1u1e971wmA6Daog7xI8BSXie73Ho2kqJmsNXir2ENCjTBubnInlSr+rcWW
 YA+g==
X-Forwarded-Encrypted: i=1;
 AKwUvBx10K/DI9P53crIc+8pr99njPxgdlCGILlYrozYJKZ3Oze8l//4s7RbJ92lsnTmj4xhvYRp2gsHsA==@nongnu.org
X-Gm-Message-State: AFq9FYIhizFH6QJdHRNei49fOjHxCriohEk+dlRXaqyudQ57teyQwOGx
 ZSh3dzVpp2kPlq9mGAAlHtTu+Q9Q5pWXJUGj4Bw5rF1HMjlDaOLMRn2WRLteyNQX46U8B3nwrE6
 EnpUnjG8Ltj8Jq9STBEN7lIha48fa4cE=
X-Gm-Gg: AYBFou0kqxeKbt2JCc6hO14BwOBSnBH8n5hBgYT+TjY/AMSvjEak/e7sDRRotMqsr/V
 zic4GMUB6bX2MWR5pI8yX732g7p7PIjweYFPIKM7s7POkAQzH9E13osOrSPgo2gIrHP4Qh9MCQ4
 tfmi4FmS22qj+syEcO4gGzUgcN3UxG2VZVodxWsYRY/V8i5ENMcLbcSI6e+iEwPwjf2fSJ/dx0G
 6SIEyZ98JYWJmb8UdX/bt9Sg+qltGm7n5ZQASkMQBrYg7ioezXJpSTD8eyyWIKK18sm3FPLRn9s
 pAgbgxeS+0Vq3dEeMGYezj/RnYP4+t3WxUrSj50L4J2MGcZxrrg1kKs=
X-Received: by 2002:aa7:d51a:0:b0:6ab:260:6378 with SMTP id
 4fb4d7f45d1cf-6aca86236a8mr499160a12.11.1790645774380; Mon, 28 Sep 2026
 18:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260926070057.1234-1-luoyonggang@gmail.com>
 <20260926070057.1234-47-luoyonggang@gmail.com>
 <aro93NuZBXYGbD33@redhat.com>
 <87e7c5ae-c78c-4a47-b9ba-9851ce5757d9@oss.qualcomm.com>
 <CAE2XoE8Fp8w4m0WBjEXF3LceFXUqKDcXhdSmhCThgkAM3wRVaQ@mail.gmail.com>
 <1f46d3a3-1275-4ae0-be07-717c643cf0ae@oss.qualcomm.com>
In-Reply-To: <1f46d3a3-1275-4ae0-be07-717c643cf0ae@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Tue, 29 Sep 2026 09:36:00 +0800
X-Gm-Features: AclHuK_udHvC7oTjEuhilwZdEHpiOvElmXHC3KV0wZOIgddeR19NpS3MIjJMWOE
Message-ID: <CAE2XoE_fxTRQJPzsDZHS44z65KR0e54cWjVpyZQGtr1sdLOinw@mail.gmail.com>
Subject: Re: [PATCH v4 46/55] qapi: add query-targets
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org, kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Sep 29, 2026 at 3:11=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 28/9/26 20:34, Yonggang Luo wrote:
> > On Mon, Sep 28, 2026 at 6:39=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <
> > philmd@oss.qualcomm.com> wrote:
> >>
> >> On 28/9/26 12:13, Daniel P. Berrang=C3=83=C2=A9 wrote:
> >>> On Sat, Sep 26, 2026 at 03:00:45PM +0800, Yonggang Luo wrote:
> >>>> query-targets lists each linked target, including none, with its
> >>>> arch, endianness, and the machines that target accepts.
> >>>>
> >>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> >>>> ---
> >>>>    hw/core/machine-qmp-cmds.c | 30 ++++++++++++++++++++++++++++++
> >>>>    qapi/machine.json          | 35 +++++++++++++++++++++++++++++++++=
++
> >>>>    2 files changed, 65 insertions(+)
> >>>
> >>>
> >>>> diff --git a/qapi/machine.json b/qapi/machine.json
> >>>> index 6aaa2af709a..d8cdea6203e 100644
> >>>> --- a/qapi/machine.json
> >>>> +++ b/qapi/machine.json
> >>>> @@ -307,6 +307,41 @@
> >>>>    ##
> >>>>    { 'command': 'query-target', 'returns': 'QemuTargetInfo' }
> >>>>
> >>>> +##
> >>>> +# @TargetMachines:
> >>>> +#
> >>>> +# One registered system target and the machines that can run on it.
> >>>> +#
> >>>> +# @arch: the target architecture
> >>>> +#
> >>>> +# @endianness: the target endianness
> >>>> +#
> >>>> +# @machines: machine type names, not aliases
> >>>> +#
> >>>> +# Since: 11.2
> >>>> +##
> >>>> +{ 'struct': 'TargetMachines',
> >>>> +  'data': { 'arch': 'SysEmuTarget',
> >>>> +            'endianness': 'EndianMode',
> >>>> +            'machines': ['str'] } }
> >>>
> >>> We already have  'QemuTargetInfo' struct which is used
> >>> with 'query-target', that should also be used with the
> >>> new 'query-targets' command.
> >>>
> >>> We need to add the 'endianness' field to QemuTargetInfo.
> >>
> >> Why do we want to expose endianness, and what endianness to
> >> expose? Endianness is a runtime bit state of CPUs. Sometime
> >> this bit is hardwired but that is an implementation detail.
> >>
> >> See commit 0e2c5647d92 and surrounding for MicroBlaze for
> >> example.
> >
> > Please take a look at
> > https://gitlab.com/lygstate-qemu/qemu/-/pipelines/2890507627
> >
> > I do not have clue to fixes it properly
>
> What are you asking here? I'm seeing failures on targets supporting
> dual endianness. I can not try to help you until I understand what
> your goal is (I asked it multiple times but you don't reply explaining).

Now I can answer the question more clear, it's because the pitfall of commi=
t
https://gitlab.com/qemu-project/qemu/-/commit/e934c624f32f6f44f427d73a2e6a6=
7e983a02ae6
cause the issue

 target-info-stub.c | 2 +-
 target-info.c      | 8 +-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/target-info-stub.c b/target-info-stub.c
index 8392d81e8f..65220cc782 100644
--- a/target-info-stub.c
+++ b/target-info-stub.c
@@ -18,7 +18,7 @@ QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) !=3D sizeof(CPUS=
tate));

 static const TargetInfo target_info_stub =3D {
     .target_name =3D TARGET_NAME,
-    .target_arch =3D SYS_EMU_TARGET__MAX,
+    .target_arch =3D glue(SYS_EMU_TARGET_, TARGET_ARCH),
     .long_bits =3D TARGET_LONG_BITS,
     .cpu_type =3D CPU_RESOLVING_TYPE,
     .machine_typename =3D TYPE_MACHINE,
diff --git a/target-info.c b/target-info.c
index 5a6d728252..a26532f660 100644
--- a/target-info.c
+++ b/target-info.c
@@ -24,13 +24,7 @@ unsigned target_long_bits(void)

 SysEmuTarget target_arch(void)
 {
-    SysEmuTarget arch =3D target_info()->target_arch;
-
-    if (arch =3D=3D SYS_EMU_TARGET__MAX) {
-        arch =3D qapi_enum_parse(&SysEmuTarget_lookup, target_name(), -1,
-                               &error_abort);
-    }
-    return arch;
+    return target_info()->target_arch;
 }

 const char *target_cpu_type(void)

Look at the diff, the original one is directly parsed from
target_name(). and the new one
defines "glue(SYS_EMU_TARGET_, TARGET_ARCH)", but that indeed does not
match target_name() at all.

And TARGET_ARCH is introduced in commit
https://gitlab.com/lygstate-qemu/qemu/-/commit/f87f7e145d63f93315e0f0e00fb9=
ba0b6ee8570f
for this.
Hi Richard, is this done for intention or a mistake?
maybe we should always generate target_arch from target_name()
in meson.build?



>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

