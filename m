Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp197767lft;
        Fri, 24 Jun 2022 03:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tQ8FBGzXeN73TW53OGBBBH14Xkp5CK/SLVB3ZRadj/2bs7FWKs95FNmcXqOQ0gCqbwSjgr
X-Received: by 2002:a05:622a:1aa5:b0:317:7742:d412 with SMTP id s37-20020a05622a1aa500b003177742d412mr7047457qtc.424.1656065229342;
        Fri, 24 Jun 2022 03:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656065229; cv=none;
        d=google.com; s=arc-20160816;
        b=aXstFRICsdYqx5Zqoah6fWOgK1HMGWF7n3l/IVtGbTVbnek+YSv/Ku2AJZRrKMmgX6
         W4jecEvf73K/wLBKCqN6nEyiqwqF1WvUBOgFRE7Bid3BS5VS4A1+zOD1BxiqxMb+i5Vl
         HY2tyxRDLnrVuPCCaT7TMqe8TLysC15fx37qWG7kjNyuNTB3net2HK41Qafw2yCfEJKy
         khnbUSa8hP3GWPkI1YypqpM6ZXTuGGoGH1iXbV6r95tb3OdCmtfEPdkEtHENLVVA7OMv
         peNFJunR538ZGD7Y3SE+Qn/Uq/EdcrSHZj81voBbbLNGZ6HAOQpIgv+SHwdWMuMxRYdG
         S+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ngj7kujS66MfNn6Y0gGXaRBCJ9j3t+t6lRC1FxqQ1V8=;
        b=BoAJ44Tl/g+Ba9mnDewAT4qULo7sy3o6C8UiEJlrX8ldW5hyefrqgIul9t4IH5mIyK
         /H0CawUwyZieQUp5VcV2VLtDvD+etf+mrx+bEtBE7yRNc3w9Ukbj6sAO4dXeYOJcITs4
         A5KE18xTf7UFNm/70Gd5ZXhhFGSxyEqO52eRCWS6k4xh+bsOEpw/yVoUBeanRbSZnRO8
         oI4+jiu6T0hDoUGj1I3U8AxrNC5QW8OEQllmVabfWXtNPRIEKoCVV2fRSpjoiuYRAr7Z
         /HYLu9WZA3llp/3FRIy5Q8C991n0mSjL0aCD4kYhAXKyhTFhvf/AuaxqAMlhOq+amttd
         KcZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nqa11Ca8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn5-20020ad45d65000000b0047052b952c1si1142438qvb.509.2022.06.24.03.07.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 03:07:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nqa11Ca8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4gDU-0007Dz-SS
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 06:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4gD2-0007Cs-0d
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 06:06:40 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:41688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4gD0-0004cO-Dr
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 06:06:39 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31780ad7535so19688677b3.8
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 03:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ngj7kujS66MfNn6Y0gGXaRBCJ9j3t+t6lRC1FxqQ1V8=;
 b=nqa11Ca8zAqJIexN50nhEF1S6e/eiczn+KGMvOLbhOg9Zu62XmmUoiByTfGoBhvRFE
 8xIQVHLRKWcaUq+EHpoHGJ5jYsC8rcNsMSEEKfqHDSnfh/vXwDY3anrmieTyzO9QcfA6
 F9pGEux/PbfexO4jwUynLJK7aVCvXNXmOIEb/Ij8CeK8KV3e8aM+lWfej+wBBegXajWH
 b9EVNsQRCI1nBgYB+wzHZimD55YCMluDa3Bvp6TZFA5iBx1i2ejU0wfT83ogPwmPN3th
 NxUiM6FtOekzdh+q5GFMmH0vqrzgxsVbA5kkb/92W+glCOuCbWpOULNfuMi3XkX3H1FE
 NynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ngj7kujS66MfNn6Y0gGXaRBCJ9j3t+t6lRC1FxqQ1V8=;
 b=iCMaMhvPGeDmBJ/FhzDZRT4kWnthD+LhLpQo3TCK+6UEUn8A8WqFo7suNkzcp9JMXw
 P3lpqrbFDODhP2PnTUXt/HgggazZQ+f9sSMFaKyk0fZCGanYoQsdPmzFUoiZyH6emKst
 NxkchFSFBiW1fgv2nFwz3+eZ9kPcEx7ycMDBXjg5Oc/MbKBEuDiKMVuyYZMW2j05gLhP
 fbtOUsvkRcmGNKcLIekKwMKOsYPo6nnDH34vvSDqK5L8AGg//9jfS3gyTJ6Bklp0UZNY
 Hj9kMLINxOOPtg8ce8XJCSawhDWqMUALkF6M4Wrrn/UX64r1b/oTAXJxoLrbhBc7IArG
 0ueg==
X-Gm-Message-State: AJIora+USA45NindVHNe4+NbuvorHlQQ4HxsCrl+WAK4yRhaSe2RqPxJ
 S7FrBY3dSB5nLGvkCAcVRYBLBRyU7bxviR3KkZo72A==
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr15914138ywd.64.1656065197148; Fri, 24
 Jun 2022 03:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-27-richard.henderson@linaro.org>
 <CAFEAcA932Ud1PH4Az=NVW02mR8Q_GNmsH-kvLTRZ_TmCR8=Psg@mail.gmail.com>
 <c6308243-0742-b9dc-a325-da095e687181@linaro.org>
In-Reply-To: <c6308243-0742-b9dc-a325-da095e687181@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 11:05:59 +0100
Message-ID: <CAFEAcA8nYEYjL4Go4tZJtGWU8F2uY1_AWKpn3ux+Z94+GD1mVg@mail.gmail.com>
Subject: Re: [PATCH v3 26/51] target/arm: Implement SME LD1, ST1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZyX8EAO6qrAG

On Thu, 23 Jun 2022 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 6/23/22 04:41, Peter Maydell wrote:
> > We now have several rather long functions that are
> > pretty complicated and pretty similar handling the various
> > SVE and SME loads and stores. Is there really no hope for
> > sharing code ?
>
> I'm not sure.  Maybe.  The two issues are:
>
> (1) sve ld4/st4 -- arm didn't make z29-z31 illegal, but defined wraparound to z0.  So I
> pass in a Zreg number not a pointer to those routines.  So the routines can't be reused
> for Zarray without changing that.
>
> (2) sme ld1/st1 vertical slice, which significantly alters the spacing between the elements.
>
> One possibility for these cases is to perform the load into env->some_scratch_space, then
> copy into the final position afterward, and the reverse for stores.
>
> Is that preferable?  Do you see another alternative?

Hmm, loading into a scratch space seems a bit clunky too.
I'll leave it to your judgement but I guess since you've already
written and tested the code we have here that argues for going
with what we have. Maybe we'll come back in six months and
realize there's a neater approach. (The GIC ITS code ended up
being refactored like that.)

-- PMM
