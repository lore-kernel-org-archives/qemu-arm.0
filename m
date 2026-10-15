Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B75CC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:38:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIqt-00030b-H9; Thu, 15 Oct 2026 06:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHIqs-0002xX-Bc
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:38:22 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHIqq-0006Dn-QX
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:38:22 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8ab43af5e97so50667257b3.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792060699; cv=none;
 d=google.com; s=arc-20260327;
 b=IezcTPXkWfuTMkyZLy7ecDUs1vMoMzuL5MHyvfUz+hfM9em0oS5MF79fiAF3ilk/yZ
 jWobhqinwarxtoxqEbmz5vC05tRyVqIL5B1/AF5WSUjXiZtA0zIPCEZhdRbQCj8KjpuU
 oFmPOjQd7adkvR6P5wPpeup0tkdR9uOTqnsGR9+ZlEvkoTJ74lhmflGg2f933nOP33MB
 mLgeO05Dc+0hyY9eBwYntv3VI9EzxAmZIf8ONwKtVG3fXjHP3pHti+eJEuNKKeAdPx/w
 E+yvjZM9YPjjiBSriNwiOd7hA/3dgd6jSKEMZjS/YYdgoPN3NAjQAgyfwhcd5zrnf6C2
 SVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=2n4IHwJGStSj6XIDhmiZ1DyVKnU97it7aYpS1dErJm4=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=Yu2HxZS13LSApfKUs3+AykxMhAKSUrp7k5ViWQ/J4jOhWkQ5LWRR6lqIYWbvOm3b7U
 cK01mqluYtV0iVjnoGUXXQ2iIfu7Y32zoxE13T2MYFBBXjGYON16dYjpklNQ+8sEqonW
 nL8rQnIGgjcEf4ADtxS76SwEh5FHtRTPYueZog8RSIT6OLiIq031uPPDtv/E0fNT4ux+
 qBeISl6wdOjzd5nPEJpsGVeJMYvcWUcm80nEgYC/4vzl74a70cFsKPBmreBYK2b4IgVx
 a7EFtvfVIId63VzhqWKnx7fo1JJd+vQDdT4HlGGWN+EvPS3pYFB7qwKLI+K4j7aKg12C
 ymbw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792060699; x=1792665499; darn=nongnu.org;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=2n4IHwJGStSj6XIDhmiZ1DyVKnU97it7aYpS1dErJm4=;
 b=KLGpzO/vSaLaYspIUNbmKSkA83vPb1m5gFt4+aJ1DC/OBdDiPtDKpG3DsM/97xFikR
 7vY/LxqKlOv3kkakQ2w7JY6m9O9JLSugctNpczhVpK0HRRExQqvmdiZIwj5cmG+QbKGv
 d5KHRctES1cMcAdLgddXVdb0kWDaMayihk5dX2Ep1c1qYmBDRQ991CtvS9otNHlmaMGF
 At0m0AHzf8OOkj3ctHdG3mzKN5YWY3LsiUm7ato2NEv00jhkZmbvomdpVYTlR8oT/Snp
 IE3msPRaj7ePiG1YBe8IGyIf50+8iV+eeiI7WteHTtRd6fJ7G9HmL2lnxJNPfigMP/Vj
 /IWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060699; x=1792665499;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2n4IHwJGStSj6XIDhmiZ1DyVKnU97it7aYpS1dErJm4=;
 b=JBXMH4JiH5izG2S4cdJLAmENsnmwtv2w0+rI4pGEubInJcmTe34KGeIboxMPHyyN71
 6Chvu0wiSgI+jAcPthcPHGfapIOZ/ljDoS69dsH+Qix2hGY42Hy6rFe2+Kgo9iMLEa2m
 pyG+DUeZlFtZ6d5H63vtAtma//ar52E5M3NKWD7I0zp30qJrLwu8r2BGFujvbn20013m
 dWtyYV+nmteP2EAQkDkXbAy1+mTIKrtaGp3iB6vfcCCfpfSjdgrxzGqLzqDopuwGPnv3
 HtqAfF/sIi+DyC/UOCSkIDWmaKAw383SHiMxQADNcIRSA66RumXkSeCbDlJzW0i9QHcn
 kqew==
X-Gm-Message-State: AFq9FYJTDLJlggs53nW/AhMUs/eZF9oBj/c7FAtWKqjOeOa/JpwcyJLD
 FosCG1V14Y3cPz3nniDWsnG+xHF1tUWSSEvR5+rEMiFXPzsimShQI9ImV98cUsMHZze/9TOvGgu
 RUWNAK7SjctDaNC5BYNFhaOtuPH+wItwqZxYDFn+5/JZ5wfxDhTMf8ZI=
X-Gm-Gg: AYBFou0kdaQhsdN1WPB8UCcWGEKo6akNZoxgYYWz/TIeYvJ0lff2ZmKKOcK5o5mOAs7
 rZp5LJh5pWFfTRLaac0doFlBYbk23Jhg7h14h7hph6Vzziu3IQyf9CWuYOqdEdzpk3izBbkLpzy
 sNNyASFY44HqYsMGX5jY694wtn7hi2ZE/zzPEM5IUx2C3lyEYWGpHyACPsW93yR2pd1cQg+3hok
 740LnbaIlMvDrXvH5lj4Dw/AxoslPCxL0ic4OX8Jvlhjtp3k/eeyXakNfE4KVexxm+FDjbTLBTx
 C46VMxZN68W4YaGbJnfzk4Yws1skex51HoDFFvTlApEkiHdGmjvyTSN9VNXZPHRo4MsuFd3fn8z
 J45BIE+CgFXElBI6Qrj4pfW754cbeJcfvzpDuSSg=
X-Received: by 2002:a05:690c:6d03:b0:8ae:68d9:cef4 with SMTP id
 00721157ae682-8b07d46649emr58856647b3.28.1792060699317; Thu, 15 Oct 2026
 03:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-79-peter.maydell@linaro.org>
In-Reply-To: <20261013083933.1024405-79-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 11:38:07 +0100
X-Gm-Features: AclHuK8m9hGewqbSVDBzHQSBzBbr7hoX_JxXqYxktbQmNdRBvDG988yndY5PuU0
Message-ID: <CAFEAcA8ze6dnn6=+0QOP+tU3wZcn85bQ8ibLChDUxzNwWbWXWA@mail.gmail.com>
Subject: Re: [PATCH 78/86] hw/intc/arm_gicv5: Recalculate vHPPIs on VIST and
 VPE mapping
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 13 Oct 2026 at 09:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> If the guest maps or unmaps the vLPI or vSPI for a VM via
> IRS_VMAP_VISTR, this affects the vHPPI for every VPE in that VM, so
> we need to recalculate it.  Similarly, if the guest maps a VPE for a
> VM via IRS_VMAP_VPER_WRITE, we need to calculate the initial vHPPI
> for that VPE.
>
> Add the calls to recalculate the vHPPI for these register writes.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv5.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
> index b4dbe7ce3e7..199547abaed 100644
> --- a/hw/intc/arm_gicv5.c
> +++ b/hw/intc/arm_gicv5.c
> @@ -613,6 +613,19 @@ static void irs_recalc_vhppi(GICv5 *s, VMTE *vmte, uint32_t iaffid)
>      /* TODO: we may need to generate a doorbell interrupt. */
>  }
>
> +static void irs_recalc_all_vhppi_for_vm(GICv5 *s, VMTE *vmte)
> +{
> +    /* Recalculate the vHPPI for all VPEs in this VM */
> +
> +    for (uint32_t i = 0; i < (1 << vmte->vpe_id_bits); i++) {
> +        VPE *vpe = &vmte->vpet[i];
> +
> +        if (vpe->valid) {
> +            irs_recalc_vhppi(s, vmte, i);
> +        }
> +    }
> +}
> +
>  static const GICv5ISTConfig *ist_for_vint(GICv5 *s,
>                                            GICv5Common *cs,
>                                            GICv5Domain domain,
> @@ -2131,6 +2144,8 @@ static void irs_vmap_vistr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
>      }
>      return;
>
> +    irs_recalc_all_vhppi_for_vm(s, vmte);
> +

This call should obviously go before the "return", not after.

-- PMM

