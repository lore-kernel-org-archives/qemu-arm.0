Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119BFD29FF7
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Jan 2026 11:52:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfzPs-0003by-4r; Wed, 14 Jan 2026 06:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vfzPj-0003Vt-2g
 for qemu-arm@nongnu.org; Wed, 14 Jan 2026 06:51:55 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vfzPg-0002i2-IG
 for qemu-arm@nongnu.org; Wed, 14 Jan 2026 06:51:50 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b872f1c31f1so368071966b.0
 for <qemu-arm@nongnu.org>; Wed, 14 Jan 2026 03:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768391507; x=1768996307; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VZW46qC+KjQrZpFG+imn0fOacc1NDIublk+rlApwKI8=;
 b=xYgjU0apy6xSghWl/1rRjRf8dPLC5LhTuuh9EPYRtYp01d/ow+zPeIW9gwCJvbjf+8
 HUwBkFC8urDlBf4Q2xRCwbiJ0KlnnTqDIKVl9TghAom0Unu5Xh75EDol3FiuWcW+kTQC
 +Jzn8+P6khazra43IkWLExKwm575Ig16OluBghnRFwa6R795d32coNTxW1mSYmkihPAZ
 UC4xlvSf10BeLodf+OOjVMFFwRN7O3eadtIKWhd6DgYDmAxcLFLhWgFyIPuMmZsZd1T6
 qtxWCbyAUaZd4RBjBNpXnY85c00cd53GLoBuiF+2bBZ95ZmQQCinzRPNzCBZM6RBYFPu
 xfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768391507; x=1768996307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VZW46qC+KjQrZpFG+imn0fOacc1NDIublk+rlApwKI8=;
 b=U1xya1eutYCm2V0E2aJC+k1IYFGDHFGrkzfx6HSGTYpAMpcqMQ5SB1g3AZyJa5b/Qz
 bQEPeg6nfAqImaQklZ4NxrxAXzRot33Z/aGW2pwU+Xfkv4iwlzcvM623Bc+TfGLZ5joD
 a+FISeRT/nEoEGBUIP/NknSUWMonrCRiURxcV5BLkkfw49GxVYZX2DJe1ZLISEDo83Oy
 Pu0KEmZ6WtHnG72JyVCirvTFSbNQI6r9jpius7ItlCI+YN4B8oaWg1/YNkTiW9MSuI/q
 dwZjuRJzLudUCjxTc4FK2BvidITno2urj3zlnhR4L/4JjDJjJpoDuW9y7BVnHdVRCMZE
 Odxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpckA2eKMmmYomaHedyfGIat3X73lxfIgHOAjpNMVjndOBU1zmfjlNgRG1i1FAUJAhIK8Dlszmyw==@nongnu.org
X-Gm-Message-State: AOJu0YxkCbJc7EQRdQj43wCwnqyKw599ZOAuCnFJ0lxpkwUgC0VDptaC
 AFTxSikkPgElO4N2yiKy5QITCHH9A1MKWYHwykeijisQxU8UilSJEcgcEU7sWSFkkf/ma3+ejue
 12CxnvGExQx8GDf6gir0I1g8HouV1H4xp/IxS5Pnb1w==
X-Gm-Gg: AY/fxX4b5osQN9DHSRiHoLyqzUEVTCHOQYuhtzIITbca6Ae4zG40rYDlk1l0IL6z210
 xZ75dKWYM59gpvv+cCA5fEnkngWCMVYtHAC+E3IxHtKuRd6ZjO9a2DER0/b3VJ4TstqJsMDbaOF
 AQrLiPyJOM9YuHC3pPuMTbWNK/gIbFWkaJwx1ES8qpsx18qHBYLFiy709ucVEUQ6/wZjbvznoT2
 0IhGzO280AfTQmnxoI5hlgafZ3DmRCf627k6t6Phc8pILLGmQABea2cTaAFCjR7+yU3ZZhOwRoO
 Jv+F3ce85HLtpO+jYvIizh8btUM739NIV3V9
X-Received: by 2002:a17:907:2d13:b0:b87:2f29:206e with SMTP id
 a640c23a62f3a-b8760fe0fd4mr186365666b.16.1768391506500; Wed, 14 Jan 2026
 03:51:46 -0800 (PST)
MIME-Version: 1.0
References: <20260114-sme2-hvf-v1-0-ce9599596736@linaro.org>
 <20260114-sme2-hvf-v1-1-ce9599596736@linaro.org>
 <6edbbdd7-8992-420e-9aee-7596afbcf00d@csgraf.de>
In-Reply-To: <6edbbdd7-8992-420e-9aee-7596afbcf00d@csgraf.de>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 14 Jan 2026 13:51:20 +0200
X-Gm-Features: AZwV_QinTEIb0AP_BWEA7DhKGuvKW1Cp2RuUqHsY2fJwbwPTYVs3GiIj_ZDElMA
Message-ID: <CAAjaMXZehMtdZC+7obmRZgfE+T2Dn64GTY2MqncPq9grKGcSsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hvf/arm: handle FEAT_SME2 migration
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Mads Ynddal <mads@ynddal.dk>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Jan 14, 2026 at 1:19=E2=80=AFPM Alexander Graf <agraf@csgraf.de> wr=
ote:
>
> Hi Manos!
>
> On 14.01.26 09:35, Manos Pitsidianakis wrote:
> > SME2 support adds the following state for HVF guests:
> >
> > - Vector registers Z0, ... , Z31 (introduced by FEAT_SVE but HVF does
> >    not support it)
> > - Predicate registers P0, .., P15 (also FEAT_SVE)
> > - ZA register
> > - ZT0 register
> > - PSTATE.{SM,ZA} bits (SVCR pseudo-register)
> > - SMPRI_EL1 which handles the PE's priority in the SMCU
> > - TPIDR2_EL0 the thread local ID register for SME
> >
> > Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>
>
> Thanks a lot for the patches. I don't have an M4/M5 handy (yet), so I
> can't test the code works correctly. But it sounds like you did that, so
> I have no concerns on functionality.

Yes, I tested it on Linaro's M4 machine. Adding a functional test
using Arm's benchmark is possible, but I couldn't be bothered to
create vm image assets just for this :)

Note: testing migration is tricky because the CPU has to be in SME
mode for the Z/P registers to have meaningful values, so you need to
savevm while SME instructions are executed to get a useful migration
state. I modified Arm's benchmark to compare the SME matrix
calculations against the non-SME calculation to ensure they are the
same and I savevm/loadvm a bunch of times while it ran with added
printfs in the get/put methods to print whether SME was active or not.

>
> However, I have concerns on a few maintainability aspects. You #ifdef
> out a lot of code conditionally on the target macOS version. Any of that
> code that is in ifdef may or may not end up getting compiled in CI or
> other test builds, which means you are missing out on a lot of
> compilation test coverage. As a general rule of thumb, please reduce
> #ifdef to the bare minimum.

I agree completely, the problem is two-fold here: the HVF exposes APIs
with API_AVAILABLE(...) (clang's availability attribute) and also with
plain ifdefs (__MAC_OS_X_VERSION_MAX_ALLOWED >=3D 150200), and
specifically the HV_SME_FOO_REG variants, which cannot be protected
with the availability attribute. )

So every time an SME type such as hv_vcpu_sme_state_t is used, it has
to be guarded :/ __builtin_available(...) check is not sufficient
because it will not compile due to undefined types.


>
> One thing I like to do (when possible) is to use the ifdef to define a
> global const variable or an inline function. That way the compiler's
> dead code analysis will eliminate the non-active aspects of your code,
> but all previous compiler phases still run which means you get syntax
> checks.
>
> How much of the code down here really does require #ifdefs? And if it's
> a lot, maybe we just bump the minimum required macOS version instead.
>

The missing type definitions and missing function declarations will
still raise compiler errors unfortunately. We could add those missing
type definitions as stubs if they are not defined so that it compiles,
but I chose to ifdef instead. What would you prefer?
>
> Alex
>


--
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

