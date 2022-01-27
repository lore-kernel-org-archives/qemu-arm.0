Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4241114lfk;
        Thu, 27 Jan 2022 09:13:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUgxlXu6x90auHfIimc/XrnclfhZWcrLleGn7p92loms++VsjgRInzZqnz+lmrmYQJ4d78
X-Received: by 2002:a05:6602:1541:: with SMTP id h1mr1300547iow.145.1643303613763;
        Thu, 27 Jan 2022 09:13:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643303613; cv=none;
        d=google.com; s=arc-20160816;
        b=KVoEN0RzDzwfDCGU+cI3whYk+++OESfhNlGXV6wImtDhxtHccgI7R6H3CrWXhVjH11
         +XALN7Bh9lPNGQUpYiWPiDY8NfwGQK0Mhjclu99q+NpTSUsxxaRSNbnlN/DcLJ7s0SNP
         qc1IJBIdrmAeKg9FqoEmoQfScn8+JTrWRBQZbMwIUKhwXHRgvBp1J0i6dp7ObD26pOYT
         y8P12fw0y23tzQJT6ujHuza6LofHQLyysRxExdr/+OBpUUL0BNoE0ViKCJ/l8qDiTfiY
         x1JzSa+2gv7SbE4F7Y3CgrObXhTvqs/DxvyCOAo5Q+Ov3tPvI9SsBXGmVOs2qYcUgShS
         I+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fNiOAmQ420Z6ck2EPpcnI4GeChvrAMoNnPkgJzts4ks=;
        b=pHtURTwEKhTc1nGeduOevDHVRTn4xlc4yPhf9w73wGnAgXICZVoVxscYz4AolACQZK
         IY4PvRwP8k8jX0AHz2lCLTTe3Y8+fE18UUjqgbHkCHhxhMvesX3Cuk5pEEI7/q+z9eRt
         9M5rNhA3C02Km2D1BPwsW2IpssIspQD81HSVlolWAsyiqdJRsEfBNaSs8wCEEsTUKlcL
         Q8Zq5Z7A2B/Yu8jVXpJiHQaLCAOfyAKHOT3+GO8KK4ise0/pdkub/tiWI9+Xp79C7q1P
         H7hiX0MauMxKVfjC+LqzQaAbTbBT9LBlPXx8UjerEV6/pTGs6XOph6/UYr/s7VRc1kwc
         GciA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=asfw1szO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20si1664333iol.23.2022.01.27.09.13.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 09:13:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=asfw1szO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD8Kz-0006GN-3b
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 12:13:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD7gT-0003iJ-Cl
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 11:31:43 -0500
Received: from [2a00:1450:4864:20::42c] (port=36503
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD7gP-0006mR-QG
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 11:31:39 -0500
Received: by mail-wr1-x42c.google.com with SMTP id u15so5826357wrt.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 08:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=fNiOAmQ420Z6ck2EPpcnI4GeChvrAMoNnPkgJzts4ks=;
 b=asfw1szOoVSo88nALFIcwdBw6mhqCQefy1frIZq/RAC8/QdJyL51ua+3mrxZQ3uQ3Q
 ePKEW2bKBghQ/HVZLu9DE3TnI1PTxl5v1bFbRVkgipB4d/M0mq+Re/wGeJIaB7SH1+Ru
 Hjx1ppxz7LjiMBkzq9WieczR6lkpQAU9mZFG4edNX7Z0zcVquKLqji4xRAKOMYd5QrTn
 BlekohTRqw4OmttxHcLAl65FdVlsZU/wC6P0hXiy+HHaJwaoWgifOP/TzLtI4d6wJS3G
 2hGdj6m+Z1lpJ32dq6csIfvO1HX/ZRSWRNkaCtVcWzWtDIIxNsW+RZovk/JPiI7Al2km
 w4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=fNiOAmQ420Z6ck2EPpcnI4GeChvrAMoNnPkgJzts4ks=;
 b=X8E9gBtOeIJBQBTAszAm9kMTznjURpPT68rYhPzTWd4ApSnnsQ56GnDqmOPic3vSjY
 NN6ME04ZSEGdFARdQ0W3CQOzUjypskFqH9gcXGIhnsWs8O9C/xhEMgjhbZXYDVSSL52t
 n7pSKNtjKUzUCWnBtvTGsRQG8kTVGPAVkiBu05L+Ni6mma/XmqhYUAy4AgoqxSq4rxzy
 Na4s45rayoU+gRi2vFiMN12thlEHIweKnpCzyEv3sqtoVNP3iDmMmv4VRnVsKt3GOm5/
 d+REINuRHv+aPjqbnndwILSYJVbbp/cKlszFbxM5QK+PG96bDXD3u7TOa8qGqIHVfxst
 c9IA==
X-Gm-Message-State: AOAM53360ep4ipRUrBOBA4bttKOffVu1+3gfiVjD7XOoFIDURd37Qxxp
 H5efwAXNJ3JFegssWY2GJFtx+CyoSW1whih9/hersw==
X-Received: by 2002:a5d:5343:: with SMTP id t3mr3738367wrv.521.1643301096132; 
 Thu, 27 Jan 2022 08:31:36 -0800 (PST)
MIME-Version: 1.0
References: <20220117131953.3936137-1-peter.maydell@linaro.org>
In-Reply-To: <20220117131953.3936137-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 16:31:25 +0000
Message-ID: <CAFEAcA8mXXg5tm=sD2_TS0vgSgG3M_yp1YWdjHtbCGZHKgv0kQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Use correct entrypoint for SVC taken from Hyp
 to Hyp
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NplWCHinMCav

Ping for code review? This is a nice short easy one :-)

thanks
-- PMM

On Mon, 17 Jan 2022 at 13:19, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The exception caused by an SVC instruction may be taken to AArch32
> Hyp mode for two reasons:
>  * HCR.TGE indicates that exceptions from EL0 should trap to EL2
>  * we were already in Hyp mode
>
> The entrypoint in the vector table to be used differs in these two
> cases: for an exception routed to Hyp mode from EL0, we enter at the
> common 0x14 "hyp trap" entrypoint.  For SVC from Hyp mode to Hyp
> mode, we enter at the 0x08 (svc/hvc trap) entrypoint.
> In the v8A Arm ARM pseudocode this is done in AArch32.TakeSVCException.
>
> QEMU incorrectly routed both of these exceptions to the 0x14
> entrypoint.  Correct the entrypoint for SVC from Hyp to Hyp by making
> use of the existing logic which handles "normal entrypoint for
> Hyp-to-Hyp, otherwise 0x14" for traps like UNDEF and data/prefetch
> aborts (reproduced here since it's outside the visible context
> in the diff for this commit):
>
>     if (arm_current_el(env) != 2 && addr < 0x14) {
>         addr = 0x14;
>     }
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index cfca0f5ba6d..a898e400f6c 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9655,7 +9655,7 @@ static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
>       * separately here.
>       *
>       * The vector table entry used is always the 0x14 Hyp mode entry point,
> -     * unless this is an UNDEF/HVC/abort taken from Hyp to Hyp.
> +     * unless this is an UNDEF/SVC/HVC/abort taken from Hyp to Hyp.
>       * The offset applied to the preferred return address is always zero
>       * (see DDI0487C.a section G1.12.3).
>       * PSTATE A/I/F masks are set based only on the SCR.EA/IRQ/FIQ values.
> @@ -9669,7 +9669,7 @@ static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
>          addr = 0x04;
>          break;
>      case EXCP_SWI:
> -        addr = 0x14;
> +        addr = 0x08;
>          break;
>      case EXCP_BKPT:
>          /* Fall through to prefetch abort.  */
> --
> 2.25.1
>
