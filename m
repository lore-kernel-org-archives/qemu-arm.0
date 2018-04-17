Received: by 10.28.4.212 with SMTP id 203csp3666559wme;
        Tue, 17 Apr 2018 03:51:22 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48wRBoUHen7J6utppk3gbm5TAiy7cJ2ed+0ucQbZCLm8dn4oy+cDGohkteG4kB8KG7DlG+3
X-Received: by 10.55.93.65 with SMTP id r62mr1714049qkb.143.1523962282206;
        Tue, 17 Apr 2018 03:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523962282; cv=none;
        d=google.com; s=arc-20160816;
        b=BXd/u6Hoi6JShHWfGECJwxdcPzpM3nuuXniJWnomVvszq2TVJniyPgqA6BgTaFKRhV
         HPctv9+IC7bBDDaE1bR1kc/+RmLwsJN/cZRNT0cOE5XSV6Vx9KOZKQQ7BOMhhHHdCHyr
         2WpO2UuYelifQHca0VacmbkAXwrs0fvRjx272F+bzVe5sCsnQdJkmaXId94B6Ci2r1Jq
         UWGaz8Prvn+4avihX3UyATuQDNR8DAGa7cqwvvMSp4A0E86sVSE/bu3oj3s2VbPo2qId
         ZPRkBuMUCp8tPMyheTdmnfMeqNNqls1Zt5pyXg3ooJo6tL66/1MWG7jmhTk3UoxW57Jf
         KpFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Y8ICYXvgbMw+2hSLUbIAkM6zhN1UwhTT8m5rr6bRxxs=;
        b=H58k6xctMY5aMvfkjtJJ2Z+LTEvXRjDIXAEG9/cBsGq9JnCHwel/6QpMAndeqczyFp
         1vM6HQUsPakVvvDVJSD1OJv1xmx9iAxnz8QUUwRgPVKfmflhJC8aIptdBkuRduSSqZrn
         N7F0QkbSyLBeRSO5SVE3wDtICIJOwl//m8JjbatoUR89GtiWaPfyii+yTsKvZWyifwAe
         WyoXhh5oM8It4OVaNxHIGcPV+cvnn8bXX9RhOOlzVaXINQqE/Dyc6/OCBgTYb6goe5f+
         rkDKBgEKpyYxSOuikN5AE8/3REcBxVydL+4Yxli6xu+Zch/Jhgh6bWjLlLpgwGfwcLwb
         HxVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M8C2Di0j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j90si86712qtb.375.2018.04.17.03.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 03:51:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M8C2Di0j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8OCn-0005W9-MT
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 06:51:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8OCd-0005UW-82
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 06:51:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8OCX-0001zo-0x
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 06:51:11 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:36682)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f8OCW-0001wI-PJ
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 06:51:04 -0400
Received: by mail-ot0-x241.google.com with SMTP id p2-v6so4038821otf.3
	for <qemu-arm@nongnu.org>; Tue, 17 Apr 2018 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y8ICYXvgbMw+2hSLUbIAkM6zhN1UwhTT8m5rr6bRxxs=;
	b=M8C2Di0jeO7HtSvcH47TlM/EvNr6aq6/JtOWDZuWbvG+O1Zj5GxUY9cl03McmMBYx8
	C+tzjQmkaUu+ws8tnHh4sOmD2KKAwblg3X4osY7W7HtPbVUVM6MFGIvOO2fwb84YDnkz
	dYSoXJD7JNZlAAPKBpYP3hO3JgTYX6GMwTp2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y8ICYXvgbMw+2hSLUbIAkM6zhN1UwhTT8m5rr6bRxxs=;
	b=ADRGCNz0Swj4ML+S5SZU20mqv0J2uGO33JALK04xplBWly7fQ3BGw1oixfJ5ndGsFm
	Q3FXBUBo9bAH5Cju11rB4ZBxj4U2RElzsZVPq9bXIYZ8Hql3wYfI9AMEOs8bO5XL6p6X
	NigUvZJPlnQe563rAC45HhStuUVw/Pg/UjAQCLK+B5ko/at7CMQN3c68LTvM2fO/xvho
	XQd97ktjmCcQwUaOoTJme6sYJaHuoDG6kPSr0ISswrzBE/GET8Zo/tKlNUVbccK8Hj7i
	PEtYDHKvbD0bjp4Not+lXwHWT6v8Wn2mT7XPjU+65hQQgfF/r4+rCWX61p52JbzcrRn5
	Dn+g==
X-Gm-Message-State: ALQs6tBMFxXHgQNwqxwUDXPk3l0PgHwlXuDwvovtpSPsWhru0kgRgf4t
	SP8yEHhA+53wvCQc9OdQpIvQ1QE2CKecAVUcNO0c7A==
X-Received: by 2002:a9d:32f5:: with SMTP id
	u108-v6mr916097otb.308.1523962263776; 
	Tue, 17 Apr 2018 03:51:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Tue, 17 Apr 2018 03:50:43
	-0700 (PDT)
In-Reply-To: <1523518688-26674-10-git-send-email-eric.auger@redhat.com>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
	<1523518688-26674-10-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Apr 2018 11:50:43 +0100
Message-ID: <CAFEAcA975eWahb21gKHXJ0g1yenkmuYx4dysNgPZb_qEQ7FCMA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH v11 09/17] hw/arm/smmuv3: Implement translate
 callback
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Christoffer Dall <cdall@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O9m5yVWevYLH

On 12 April 2018 at 08:38, Eric Auger <eric.auger@redhat.com> wrote:
> This patch implements the IOMMU Memory Region translate()
> callback. Most of the code relates to the translation
> configuration decoding and check (STE, CD).
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>

> +/* @ssid > 0 not supported yet */
> +static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
> +                       CD *buf, SMMUEventInfo *event)
> +{
> +    dma_addr_t addr = STE_CTXPTR(ste);
> +    int ret;
> +
> +    trace_smmuv3_get_cd(addr);
> +    /* TODO: guarantee 64-bit single-copy atomicity */
> +    ret = dma_memory_read(&address_space_memory, addr,
> +                           (void *)buf, sizeof(*buf));
> +    if (ret != MEMTX_OK) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Cannot fetch pte at address=0x%"PRIx64"\n", addr);
> +        event->type = SMMU_EVT_F_CD_FETCH;
> +        event->u.f_ste_fetch.addr = addr;
> +        return -EINVAL;
> +    }
> +    return 0;
> +}
> +
> +/* Returns <0 if the caller has no need to purse the translation */

Typo, but I'm not sure what you meant instead of "purse".

> +static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
> +                      STE *ste, SMMUEventInfo *event)
> +{
> +    uint32_t config = STE_CONFIG(ste);
> +    int ret = -EINVAL;
> +
> +    if (STE_CFG_ABORT(config)) {
> +        cfg->aborted = true; /* abort but don't record any event */
> +        return ret;
> +    }
> +
> +    if (STE_CFG_BYPASS(config)) {
> +        cfg->bypassed = true;
> +        return ret;
> +    }
> +
> +    if (!STE_VALID(ste)) {
> +        goto bad_ste;
> +    }

This check is happening too late -- if STE.V is 0 then other STE fields
must be ignored, including STE.Config, so it has to be done as the first
thing in this function.

> +
> +    if (STE_CFG_S2_ENABLED(config)) {
> +        qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
> +        goto bad_ste;
> +    }
> +
> +    if (STE_S1CDMAX(ste) != 0) {
> +        qemu_log_mask(LOG_UNIMP,
> +                      "SMMUv3 does not support multiple context descriptors yet\n");
> +        goto bad_ste;
> +    }
> +
> +    if (STE_S1STALLD(ste)) {
> +        qemu_log_mask(LOG_UNIMP,
> +                      "SMMUv3 S1 stalling fault model not allowed yet\n");
> +        goto bad_ste;
> +    }
> +    return 0;
> +
> +bad_ste:
> +    event->type = SMMU_EVT_C_BAD_STE;
> +    return -EINVAL;
> +}

> +static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
> +{
> +    int ret = -EINVAL;
> +    int i;
> +
> +    if (!CD_VALID(cd) || !CD_AARCH64(cd)) {
> +        goto bad_cd;
> +    }
> +
> +    /* we support only those at the moment */
> +    cfg->aa64 = true;
> +    cfg->stage = 1;
> +
> +    cfg->oas = oas2bits(CD_IPS(cd));
> +    cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
> +    cfg->tbi = CD_TBI(cd);
> +    cfg->asid = CD_ASID(cd);
> +
> +    trace_smmuv3_decode_cd(cfg->oas);
> +
> +    /* decode data dependent on TT */
> +    for (i = 0; i <= 1; i++) {
> +        int tg, tsz;
> +        SMMUTransTableInfo *tt = &cfg->tt[i];
> +
> +        cfg->tt[i].disabled = CD_EPD(cd, i);
> +        if (cfg->tt[i].disabled) {
> +            continue;
> +        }
> +
> +        if (!CD_A(cd)) {
> +            goto bad_cd; /* SMMU_IDR0.TERM_MODEL == 1 */
> +        }
> +        if (CD_S(cd)) {
> +            goto bad_cd; /* !STE_SECURE && SMMU_IDR0.STALL_MODEL == 1 */
> +        }
> +        if (CD_HA(cd) || CD_HD(cd)) {
> +            goto bad_cd; /* HTTU = 0 */
> +        }

The location of this check means you're going to be ignoring HA and HD
if EPD0 and EPD1 are both zero, which isn't what the spec says.
Since the HA/HD bits aren't dependent on EPD*, it would make more sense
for this check to be outside the for() loop. This applies
to some of the other checks too: check the pseudocode CD_ILLEGAL
expression and in particular which parts of it involve checks for
N_TRANS_CFG0 or N_TRANSL_CFG1. At least the CD_A and CD_S checks
should also be outside the loop.

> +
> +        tsz = CD_TSZ(cd, i);
> +        if (tsz < 16 || tsz > 39) {
> +            goto bad_cd;
> +        }
> +
> +        tg = CD_TG(cd, i);
> +        tt->granule_sz = tg2granule(tg, i);
> +        if ((tt->granule_sz != 12 && tt->granule_sz != 16) || CD_ENDI(cd)) {
> +            goto bad_cd;
> +        }
> +
> +        tt->tsz = tsz;
> +        tt->initial_level = 4 - (64 - tsz - 4) / (tt->granule_sz - 3);
> +        tt->ttb = CD_TTB(cd, i);
> +        if (tt->ttb & ~(MAKE_64BIT_MASK(0, cfg->oas))) {
> +            goto bad_cd;
> +        }
> +        trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb,
> +                                  tt->granule_sz, tt->initial_level);
> +    }
> +
> +    event->record_trans_faults = CD_R(cd);
> +
> +    return 0;
> +
> +bad_cd:
> +    event->type = SMMU_EVT_C_BAD_CD;
> +    return ret;
> +}

thanks
-- PMM
