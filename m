Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635FBC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 15:37:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiDIC-00029r-F6; Fri, 10 Jul 2026 11:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wiDIB-00029M-G4
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 11:37:31 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wiDIA-0005sr-0r
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 11:37:31 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-667bae10ba3so944714d50.2
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 08:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783697849; cv=none;
 d=google.com; s=arc-20260327;
 b=ibypK3FKk5fSiE5q2eq0RZe0/NMZfZ6/8gqMjaoIHkBp0/PfzsTlq5l5ZU+gg9xiDo
 MuOk0L/g3gkp0R8uG5uaURny6w8Z/tMtpRFUjPPTV4PR7T99UabGm5pA/YOkfJo1Rf7k
 lzHZgcMsZOrBaSGH+oHuq24nvQxQ+QiiieowRyDM9RFCvcMZHWMloM8g96AxqgFD4CI7
 v9hksc/LepyKQ/wQaPIlYwQOHwDvo11ZabVBZQWZ4NntIPAqCeppNWcqIN+GLxSOx7gC
 gJgGHEeoBqCBOo8k+Li7DtyauTL7oReQ4FBP1+irxokxiQA/AjkIsv2N2D4UjbgrB+hB
 h2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Ag4xZwJH7gb8h0r+0qSJVFucgFXmp4y/0lv0QiWfd2E=;
 fh=zhYXsL2TiZy866rFRYFj0Fkb4tgHwJ5UN2ny3BmHTD0=;
 b=Mh+Vavt/scE4QwJP3HmAwr50P80wX3EyWIAkCzRIceyn5QX7ZTo+4tm8oC5NdeywwB
 SDf3uaaoF7+OWv+Pz3/geg9znz2+zXJII5YwCNwZU4YopLZKRYbOfGxM+Ujxn4acuYqS
 MKY1gjTQJ7Tbq2aiMKN0RRGD8mm8HaRs/DKX+0JbjDj02NYH/8ola6LrxWc/oGqOb8ll
 DgMZb2Zs81vAk1FwmA4pmIxUrG8XxpP2WjDWD6D7+pmUhLy03JMvteiepNDm5J325/mx
 lwFRRzJOvbPr8Yr4ltL88zf2gAU35tT4K5b/mrwiOtjAWgOSIy4UEzOOZUmAF+liJtXb
 e9TA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783697849; x=1784302649; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Ag4xZwJH7gb8h0r+0qSJVFucgFXmp4y/0lv0QiWfd2E=;
 b=N+f9ljeW+HETTvmarfJyOpoaqnMd2FmpcWpdJ53Zo+AruF8m/6qt8WeRGNyid+Wl1w
 GbhbQcto+wNVjpyGc9y3DAriAYfT77oD15QoGimc8mRzzPjJBocs1rPvRVRlzJraj58k
 bivyIL9JIO2ZVyUROcVLYIq+1fcnzEB8roT6u6QBTGEarH0mc+ZffLF0vqKvO9kvjdnF
 3f2bROb8fcAlxyuJ3Rqoje4VdIru3GlFukVRQgSJJOY5FzHjPsUybCyip4tRbfNvPSUJ
 HnlocbsMzSsGDMXgu+e+BZEOGQ+Cwxw5Sra4YBINAELBwZzml8HphYieKfTwJ4rwPIZ6
 n4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783697849; x=1784302649;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Ag4xZwJH7gb8h0r+0qSJVFucgFXmp4y/0lv0QiWfd2E=;
 b=bmS2xalfvGWk4wpRQ1WgaE7/FY031xJam6gxQvtk6CQs8vi4XQDHiVeXrv3O7NxC1f
 if9PxssBTZ6Hrpc36xXGwL+V469QJFiEGofZBD1rJty9OTM9VTbm8lrugpq2CefQ9g9y
 O81790xzXETWcebkyA6MPqODEr7Yc92BFcmypOUc+XipbIRnOaprG6/Lr9KRcGhZvnul
 5GfV73m2IdBFehKzZ/+sHu54xOdaokIN7VVzRuhkVyaP0/BOe/IjSLmV5Eahjcvxm9fZ
 lQWLpa2PmRUvNyJRx0yYOcVl3kl5ndYR6tkmhOIQLSNPS3v9eR3/wRBodVVhX/1HZDSp
 hVKQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro55XxgRbrHUSHAa/Tcsa+PHOi/+SY+r3FrAceaqJDKgKUCFHhqaSHoFFrR1SAOjmzKAS0yLFAI3w==@nongnu.org
X-Gm-Message-State: AOJu0YwWhsr7UZmSMsmVsGpf7JwkQQlRPBf0aEThAvu0LwcVi0J4H7vq
 JD6SDCuMmGqbOZjs9n6mjITUoFqIZBMSK6/g5dHp6/SQ5cjr5UTqVhdnjMcBs0xRwMAPLoqJ/tO
 9/7/dPWwe6EYtJkdRosFKbGyjzLaKFWL1b6Op10Gho81skSiZvx4IxaE=
X-Gm-Gg: AfdE7cnQfWwAucE8V/srRkVzZhTwJsdeTGuYcDvtmvgW78UtfNovl2OS1EEq3BQ9Kvg
 7n7ZTDbovH7ChPQRxtNcTVMtat9UfX/j+98VktysJrK/5E4EBZ/Go+iJP8dxuaCK7x1pSPic1pj
 L62+JwGfr/8a/FoNiDiy0ERCXYP2u+ScPUj/RQ2C4JCSkorGm2b+EzsP+ejGARs0FcTQhGtk6ib
 pyUPtPsWvEfVNPXgzY08q7x0tbFybpD+V9fz7qKqdSTCw9eZClK8riOLHwcWbO/45JKXHrgT5M+
 KdekDGRGxNWXXK0f0sLsKLV07K+PDItUthyfeu9rqhf/yGX8PyLVRFt761xeoDCHj2w=
X-Received: by 2002:a53:acc9:0:20b0:664:ae6a:ef3 with SMTP id
 956f58d0204a3-6679f1c3a41mr6846637d50.81.1783697848598; Fri, 10 Jul 2026
 08:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-guest-panic-unhandle-v1-1-6adfb6d4221e@ooseel.net>
In-Reply-To: <20260623-guest-panic-unhandle-v1-1-6adfb6d4221e@ooseel.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jul 2026 16:37:15 +0100
X-Gm-Features: AVVi8CfOawhLWs7Bm1-Vsh0ZNUpgz_FdkFUJ8b3Xi-rODP0bkwZT9YqljhRRhiY
Message-ID: <CAFEAcA9LCRKmU+r77zGp+4Rgd-uaZLPnoPPQDSfG8X5eeiynJA@mail.gmail.com>
Subject: Re: [PATCH] target/arm/hvf: panic the guest if an unhandled exception
 occurs
To: Leesoo Ahn <lsahn@ooseel.net>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Tue, 23 Jun 2026 at 13:56, Leesoo Ahn <lsahn@ooseel.net> wrote:
>
> It's worth cleaning up all resources that the guest taking and to quit
> if an exception in el1 could not be resolved.
>
> Otherwise, the guest will get in the infinite black-hole by
> unmodified pc.
>
> Signed-off-by: Leesoo Ahn <lsahn@ooseel.net>
> ---
>  target/arm/hvf/hvf.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 8b902c6882..4358cf90e8 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -2533,6 +2533,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
>          cpu_synchronize_state(cpu);
>          trace_hvf_exit(syndrome, ec, env->pc);
>          error_report("0x%llx: unhandled exception ec=0x%x", env->pc, ec);
> +        qemu_system_guest_panicked(cpu_get_crash_info(cpu));
>      }

We should do something here, but my question is whether
qemu_system_guest_panicked() is the right thing. We mostly
use that for "the guest OS wants to tell QEMU that it has
panicked, so QEMU can reflect that to the user and perhaps
reboot or exit", though we do in a few places use it for
things that are more like "we don't handle this case". I'm
not sure exactly what the right thing to do here is, though.

-- PMM

