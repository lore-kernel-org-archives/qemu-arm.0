Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F70606A321
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Nov 2026 16:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTeaP/Wq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWGAe-0000k6-1f; Wed, 25 Nov 2026 11:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lroby74@gmail.com>) id 1xWFKE-0006Pn-E7
 for qemu-arm@nongnu.org; Wed, 25 Nov 2026 10:54:27 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lroby74@gmail.com>) id 1xWFKC-0001XF-8V
 for qemu-arm@nongnu.org; Wed, 25 Nov 2026 10:54:26 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so42857555e9.2
 for <qemu-arm@nongnu.org>; Wed, 25 Nov 2026 07:54:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795622060; cv=none;
 d=google.com; s=arc-20260327;
 b=pUtjXcnk4Zrr9pQ7BPZiYPydYFex7gmp6TBnALqe60wYNz4XO2oF1zy2a4ueNqXBPm
 2mtwf/UnrYr+mOk1gxZwMZuCoTL4rbfVpdjO86Bu1u9RDRrYMwR7tH8jZaLyaqaxPKuo
 qr7D9gyVMdomCS0PLL/l5DkbIle3/pBfPqhh561MTb0F+sX+uHnDqbFhEtFFF4mKBEED
 b5uQB/d9QONmQXzWv6fXVq+qOWrpHM5Z9mSJ+U8gY6joeg965PvvGd1Mq9bXZ8w1vNVb
 Qn0nxpN4DxKtQaOmtP08e9BMFlH/D3fEH8DTK93xFuq6KPKciqxjh/01i53Icyc6kbAd
 aTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=30hCZdVhKR3Rb3CgU09Xc9wfjFwBj/fz9t/nbpHlmaM=;
 fh=S+43fxOu7jLJAjtb2B9QSBqItrDLI+7r2JyzdVMOfgA=;
 b=PrHb9+kBcWHKq3gibR2DOm5CBm2c6/s5Xj5526fhvPaY6nAyrqL/d/vzxPcy5UMddN
 67+gekmwFTYBXKw/a+Yn6tDMLV1dzbECU4LiUZxn0THZPpm50+6gvtAwYRCAR8GCQh7s
 ajCkziCJZ8cb88AZ1tMbmX4d/9wIeAC/7Q2vWBev6uxw1tI+yEab1QA6BRwrwlF5cI+4
 pgPnRIP0Hp42puPCskCd9cfgZ7h/x4frCtHNeHZkLt9G7tNEEqB9JbIp9DCkAEhu3wvm
 z9LkAkbJHHPWpUb/ZbGY3eGFQGXP/9BD8PU3FwfjcXl6JPUTLaaAGX9x9/Ka5D04cLkw
 kwiA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795622060; x=1796226860; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:mime-version:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=30hCZdVhKR3Rb3CgU09Xc9wfjFwBj/fz9t/nbpHlmaM=;
 b=iTeaP/WqwElIkcCsmC7MJQfN90AeuA/QnJsLo5l+mkBvWte7Q2EY6m6xLcb4ds6RvO
 ueUn0ab/h5fyuZgh+aYEYMBCiOwIbaMmPg4FZXO/MxDNbKu4ojrLCNYr79u6oUgQdCHs
 jVLkr1wrZKwhhEf9CmxjDrjUs0BNUbzBgB99uQzCh6lGqg4o8WOAlkQpI9et4LbGVTcU
 MtCC07VevPFI1js0wLWPIZSmN/oQj66CqryEA5wS3k8R2xH2AWbN3NK5YfaxhxgXRSyY
 nFF7wKimFChJQalNipyL7uSGtyyrbZDWnUPmgmxPyEAaQJjvpMlD7X5o47vjxIjz97N8
 LcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795622060; x=1796226860;
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=30hCZdVhKR3Rb3CgU09Xc9wfjFwBj/fz9t/nbpHlmaM=;
 b=ASNBESP8uJrMmvHzcyrz0cyG9yWHKwMFEiPhpwt5aGlqAVsT0NNOO1zw9dwaulA1CM
 QOaEcaO1GAwNc8d2+2/POgoyTr9AF8Xu0ETywMyUOq+4yNLMLuyLOfIQBUkCeNYkjhkn
 nlnkO+dcOVqLg1KXlcgEaV5km7C9qVwO16XBwlc1/CPUG5MybpK8d7+CK92fKLExQX5V
 idc0Ukh50J5Nw3QUKNKYdVNWIExtQjNoeZwxQSpCt+Tg3al8UWS0EFlKDmE1MO0pqcYl
 y22JfrK2jsEd8cMAo639aXzo+RS/ORJ6qbiMC1a5j/x8ssBd1ZRcMROjhieQSbCbcNOy
 ttEg==
X-Forwarded-Encrypted: i=1;
 AL+hErFcIz3btQ9Ci8ysGnf4hG8R6KkAr/RaPhm0Rrv1hyjbzRHC/tQynnlTG20nOB7bSmz9J1LEUMPq/g==@nongnu.org
X-Gm-Message-State: APuU4Z+ISYnf3LZctsAxxsABwgo8HMBjj3x/iAcQ6t4dAHTX0xyDRfSV
 beqTRlQ9EZAbmy4ej0rH5AJ6e5R2VC+kxugTOz5XhGeFuc5tBwVI6yHvWiIAxzVBhrPYjo4amKb
 CXNIl/GStsPiE7zX32TUmFcLuCVm6Cw==
X-Gm-Gg: AZFdTZehg9ZNma4u+WdIjEvU0kBdI3sGmnjs8BwSUgYFyR02D1M7tY+gTnSwOQFhTHp
 Azwi+Ye1r90OySLNlAu0iOojx+WR7soxfguz3dKuM/yaMwQ2F4ikyArxg8otW2gpa1K6/eKPo0L
 u7enLyOTO5BHMRB6Rij4uNK/tEzc8l3AlQJlPyfumn0ELLORo58P/J225E5rdfWnYvKIVhYHdtm
 1Kl3rQY8Fua3Cje3inQce3ZtJCbrqSsI0st3AAVh9FFj1kcrXUVImOaePNrQYrkviqTm5zdhcIr
 nAccI4G3Qd1L5J1q/0ehCPncItCrjS9Av4yL2X8lAasLbwxlsI5TQHPwGP/Uyadr5UV6mqBYYYj
 FITDwcgkQvMODmtSX78Tk0d+6T5i5KHWYLc/8ouOygG6tKyeS4tWPfnHcgjZAL0QH
X-Received: by 2002:a05:600c:1547:b0:4a2:397:73f6 with SMTP id
 5b1f17b1804b1-4bb8880974amr413936815e9.8.1795622059758; Wed, 25 Nov 2026
 07:54:19 -0800 (PST)
Received: from 101988054943 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Nov 2026 09:54:19 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Roberto Lari <lroby74@gmail.com>
Date: Wed, 25 Nov 2026 09:54:19 -0600
X-Gm-Features: Aa3M54rYcBIDfLzFHJVXc2WwIZjXPTI9Ipp5PoOHVrBiuypaaIUgrzdiQQK39OU
Message-ID: <CAF01csnadSrqFHG=qvZXZ7JCkNv9vtiF_hsmas3SmiofgTSYrg@mail.gmail.com>
Subject: [BUG] target/arm: WFE sleeps forever after a failed STXR (ARM ARM
 K10.3.1 spinlock)
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Content-Type: multipart/alternative; boundary="00000000000005d92006611bd7e1"
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=lroby74@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 Nov 2026 11:48:32 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--00000000000005d92006611bd7e1
Content-Type: text/plain; charset="UTF-8"

Hello,

since commit 01b223f895 ("target/arm: enable WFE sleeping for
A-profile"), a bare-metal AArch64 guest sometimes hangs at boot on
raspi3b and raspi4b with current master (v11.2.0-rc1-67-g6bf90d4fc5,
TCG). We have not seen it with 10.2, where WFE is a yield.

The guest is built on Circle (
https://www.google.com/url?q=https://github.com/rsta2/circle&source=gmail&ust=1795708458928000&sa=E).
Its
spinlock is the example of the ARMv8-A ARM (section K10.3.1, as cited
in Circle's source):

sevl
1: wfe
ldaxr w3, [x1]
cbnz w3, 1b
stxr w3, w2, [x1]
cbnz w3, 1b

and the unlock is a plain "stlr wzr, [x1]" without SEV, as in that
example.

About 1 boot in 4 hangs (raspi3b: 6 of 16, raspi4b: 2 of 16). In
every hang, "info registers -a" shows the same secondary core with
its PC on the instruction after that wfe (CSpinLock::Acquire + 0x38 in
the three kernels we tried), and the boot never goes on. Nothing wakes
that core up at that point: the lock holder releases with STLR, Circle
routes all GIC interrupts to core 0, and it does not enable the
generic timer event stream.

As far as we can tell, WFE does not sleep while the PE is in the
exclusive region (env->exclusive_addr != -1), but when the STXR fails
because another PE took the lock between our LDAXR and STXR,
gen_store_exclusive() has already set exclusive_addr to -1, so the
branch back to the wfe really sleeps. On hardware the STXR fails
precisely because another observer wrote the location, and the
clearing of the global monitor for the PE is one of the WFE wake-up
events, so that wfe does not sleep.

In our tests, setting the Event Register when a store-exclusive fails
makes the hang go away: 0 hangs in 64 boots of the same kernels
(raspi3b 24, raspi4b 40). We are not sending a patch: the analysis was
done with the help of an AI assistant, so, following
docs/devel/code-provenance.rst, we leave the fix to you. We are happy
to test one on these kernels.

Best regards,
Roberto Lari

--00000000000005d92006611bd7e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><body><div dir=3D"auto">Hello,<br><br>since commit 01b223f895 (&quot;=
target/arm: enable WFE sleeping for<br>A-profile&quot;), a bare-metal AArch=
64 guest sometimes hangs at boot on<br>raspi3b and raspi4b with current mas=
ter (v11.2.0-rc1-67-g6bf90d4fc5,<br>TCG). We have not seen it with 10.2, wh=
ere WFE is a yield.<br><br>The guest is built on Circle (<a href=3D"https:/=
/www.google.com/url?q=3Dhttps://github.com/rsta2/circle&amp;source=3Dgmail&=
amp;ust=3D1795708458928000&amp;sa=3DE">https://www.google.com/url?q=3Dhttps=
://github.com/rsta2/circle&amp;source=3Dgmail&amp;ust=3D1795708458928000&am=
p;sa=3DE</a>). Its<br>spinlock is the example of the ARMv8-A ARM (section K=
10.3.1, as cited<br>in Circle&#39;s source):<br><br>        sevl<br>    1: =
 wfe<br>        ldaxr   w3, [x1]<br>        cbnz    w3, 1b<br>        stxr =
   w3, w2, [x1]<br>        cbnz    w3, 1b<br><br>and the unlock is a plain =
&quot;stlr wzr, [x1]&quot; without SEV, as in that<br>example.<br><br>About=
 1 boot in 4 hangs (raspi3b: 6 of 16, raspi4b: 2 of 16). In<br>every hang, =
&quot;info registers -a&quot; shows the same secondary core with<br>its PC =
on the instruction after that wfe (CSpinLock::Acquire + 0x38 in<br>the thre=
e kernels we tried), and the boot never goes on. Nothing wakes<br>that core=
 up at that point: the lock holder releases with STLR, Circle<br>routes all=
 GIC interrupts to core 0, and it does not enable the<br>generic timer even=
t stream.<br><br>As far as we can tell, WFE does not sleep while the PE is =
in the<br>exclusive region (env-&gt;exclusive_addr !=3D -1), but when the S=
TXR fails<br>because another PE took the lock between our LDAXR and STXR,<b=
r>gen_store_exclusive() has already set exclusive_addr to -1, so the<br>bra=
nch back to the wfe really sleeps. On hardware the STXR fails<br>precisely =
because another observer wrote the location, and the<br>clearing of the glo=
bal monitor for the PE is one of the WFE wake-up<br>events, so that wfe doe=
s not sleep.<br><br>In our tests, setting the Event Register when a store-e=
xclusive fails<br>makes the hang go away: 0 hangs in 64 boots of the same k=
ernels<br>(raspi3b 24, raspi4b 40). We are not sending a patch: the analysi=
s was<br>done with the help of an AI assistant, so, following<br>docs/devel=
/code-provenance.rst, we leave the fix to you. We are happy<br>to test one =
on these kernels.<br><br>Best regards,<br>Roberto Lari<br></div></body></ht=
ml>

--00000000000005d92006611bd7e1--

