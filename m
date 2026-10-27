Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1F4606A31F
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 17:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mH24ezXf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLl7w-00044E-T2; Tue, 27 Oct 2026 13:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xLl7o-000431-DM
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 13:38:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xLl7m-0008GV-3n
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 13:38:16 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso842745e9.1
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 10:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793122691; x=1793727491; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=rSx2ojd4EIvmtuxfmRP6Vgystvotw3rKhGDzEHrGHeo=;
 b=mH24ezXfwCMxnA86V+BxCDcoBYnWptAu89aVFGd8AVjRWqTtjmAexnmO65grTprWcM
 QhIe7IgPrtZqamnIf0mnV9ea3fGeQpe5qus46qV76yNCvw7/N0vm5ua2eoJeonC79jHq
 jao/3Gn/WO1p+xUt2DPALLAWddaiiDJTdAeoe+iZBIgWOoSlw5ocQdE6UXSwYT6kYEiQ
 DLAop5uqgka8oxUKkE6ncs9lLRCYz7ptSh/PPl6RyAIy60XJhYsFjJOXgGo8S+rYnw53
 IrgPpFcFB8gCmUtfCLMccPihiU4YM4YmaHuRUs1Pc4XfLwYaQxG4DYp2SYB+VQDvqNYz
 ztiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793122691; x=1793727491;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rSx2ojd4EIvmtuxfmRP6Vgystvotw3rKhGDzEHrGHeo=;
 b=fpsOWZQXdQP0q2YvDK21kN2V31rSmAquE0w/S0Qf6IlLydTxg4rqlh5aBntCO/Qxi/
 zBY4c7A2zzNbVc6NVdZsyIU96uz3UWERqvb9RD8Lr2DaUuYnw3n3gyoN3N56BdxMvfdf
 gUq8W9vZi9XXWS+sJs4Ddkjg2kt1QspfpZ9kDGZMtJADLCCyJ7wMmLY+fSTjJAg/LU4D
 3DTIhzOlRtyzg4D50rmyrkLMRWAeKHbHLQ8j/rOWYvv3v8RDECodwn7xJjBy2jXTjY0E
 UJYfEDcJCzqFg3NRSyU3I7yGwdLWIyM+BWyLZr0Q8Qx2W0jDpKw2Ga1MNASEkcIeHG3U
 mwyA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz5IVvm9dxo82W0/HF9SdNvZ0aNcAs2DjSLhGU19TdCutuoh547c7qSVeTkyR+B0Z4u/i5BjCs4YA==@nongnu.org
X-Gm-Message-State: AFq9FYLQnK0byBCv842X/JaIpQUbO7SabkpXKRRsIKmkcGEjewcWFGOr
 kdgHaTVzO30bMjM+iqm7Jxz0cZud2sRews8u/SvA3VF2ITdAZAN0xCcWMGJRRKwkL68=
X-Gm-Gg: AYBFou1qQcrBD3OMIYA60SWblVym1Xea/JC93e6fFJ+ZI5LrTZKJjFfJk5IqcRjZItM
 whVbs1CbjA66ykBV1oUjtMKFzTt9Mbh/HjVgYLwe1ssNFePlfkIM/zS9ySxq4B5VYNKSHa6scnO
 cmcorsUZJhCVWqfOAyN0z0zZoNj1MGjSKeMnY3B4z102POexSr8gM7kVru/HRF4DxfKbe78TEx6
 KH/J8z0YWJqKH8CBPxJsfoXmCqFjRKKuDg3HDCJyUOaSmT3pAZrjq2x1C06sksDHMHb5mlwjldm
 yW3DBz/Tra2L9dCbJwyNgXiwC6ky8GAbji1XxJEERAT8w0SGJbCUdNzB1q/28TLmkHriV9Tti8V
 NFyyWvA+5or3RVTQDVncdGFBJAfTOXlazmKHxBw2RPWpfpWrYVh9f/iVIKns0yNKLrgkx5fe+hw
 jNJ+u8AurClebI7FkIuWD5qUAJmfcrIqPB7xDgPgaW/yd+v7FFd9/2II/mjMLYNoM2JCjrqjVkC
 qB8Wl+COiWQlTDK/aOiYmULrrxqldhH3oaWGzUL+4hu1asGo6QIBlU=
X-Received: by 2002:a05:600c:8b66:b0:4a2:a8c:22b0 with SMTP id
 5b1f17b1804b1-4a35ac3b3d9mr200077175e9.1.1793122691211; 
 Tue, 27 Oct 2026 10:38:11 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a930a63960sm3299975e9.4.2026.10.27.10.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 10:38:10 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 597845F81F;
 Tue, 27 Oct 2026 17:38:09 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org,  Cornelia Huck <cohuck@redhat.com>,  Thomas Huth
 <th.huth+qemu@posteo.eu>,  Ilya Leoshkevich <iii@linux.ibm.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Peter Xu <peterx@redhat.com>,  Warner Losh
 <imp@bsdimp.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Kyle
 Evans <kevans@freebsd.org>,  Keith Busch <kbusch@kernel.org>,  Matthew
 Rosato <mjrosato@linux.ibm.com>,  Eric Farman <farman@linux.ibm.com>,
 Zhao Liu <zhao1.liu@intel.com>,  Ani Sinha <anisinha@redhat.com>,  Anders
 Roxell <anders.roxell@linaro.org>,  qemu-arm@nongnu.org,  Song Gao
 <gaosong@loongson.cn>,  Peter Maydell <peter.maydell@linaro.org>,  Daniel
 P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe =?utf-8?Q?M?=
 =?utf-8?Q?athieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,  Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Brad Smith <brad@comstyle.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Yoshinori Sato
 <yoshinori.sato@nifty.com>,  Klaus Jensen <its@irrelevant.dk>,  John Snow
 <jsnow@redhat.com>
Subject: Re: [PATCH v3 19/19] tests/functional: add tuxrun kvm gdb test for
 s390x
In-Reply-To: <5d28efce-0344-4172-83bb-ed8e97b802e2@linux.ibm.com> (Christian
 Borntraeger's message of "Tue, 27 Oct 2026 17:06:52 +0100")
References: <20261019192704.3220373-1-alex.bennee@linaro.org>
 <20261019192704.3220373-20-alex.bennee@linaro.org>
 <5d28efce-0344-4172-83bb-ed8e97b802e2@linux.ibm.com>
User-Agent: mu4e 1.14.4; emacs 30.1
Date: Tue, 27 Oct 2026 17:38:09 +0000
Message-ID: <87mrrz3uym.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Christian Borntraeger <borntraeger@linux.ibm.com> writes:

> Am 19.10.26 um 21:27 schrieb Alex Benn=C3=A9e:
>> As with x86_64 we now have the bits to add a KVM gdb test. A couple of
>> minor wrinkles need to be handled.
>> The first is applying an offset when loading the symbols to take
>> into
>> account the relocation that happens.
>> The other minor wrinkle is the s390x only supports WP_WRITE watch
>> points so we skip the other watch point tests lest we get confusing
>> messages about failing to insert HW breakpoints.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>
> Hi Alex,
>
> on an s390x KVM host, test_s390_kvm_gdb fails on current master
> before gdb is even started:
>
> Traceback (most recent call last):
>   File "/root/REPOS/qemu/tests/functional/s390x/test_tuxrun.py", line 53,=
 in test_s390_kvm_gdb
>     self.common_tuxrun_gdb(kernel_asset=3Dself.ASSET_S390X_KERNEL,
>     ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                            vmlinux_asset=3Dself.ASSET_S390X_VMLINUX,
>                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     ...<3 lines>...
>                            haltmsg=3D"Requesting system halt",
>                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                            accel=3D"kvm")
>                            ^^^^^^^^^^^^
> TypeError: TuxRunBaselineTest.common_tuxrun_gdb() got an unexpected keywo=
rd argument 'haltmsg'
>
> not ok 3 test_tuxrun.TuxRunS390xTest.test_s390_kvm_gdb
>
> haltmsg was removed after review, but not from this patch.

doh will fix.

>
>
>
> In any case, zhank you for enabling s390 gdb testing,

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

