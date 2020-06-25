Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1253951lfm;
        Thu, 25 Jun 2020 05:43:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgrM22O7jdcy8qDHt3p+nc+CbLBTlEkRbnmEbMOPu2fPUhpm7Lj5BC4zUNOsX3AT/Hc3Iy
X-Received: by 2002:a25:2d63:: with SMTP id s35mr32261487ybe.367.1593089030442;
        Thu, 25 Jun 2020 05:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593089030; cv=none;
        d=google.com; s=arc-20160816;
        b=k1KJkYVAX3vHJjR5ROQ/BgV6cjEwLiR4tEe2YYE8gjKCCHAmGyI8YHcATmhU0XnVhD
         6EvIjTRBlPJrKgdlM8IYRG9pUGlblviJFoQHEajlYK2hesisyu+EO2OxO5TWuXUOjVLD
         7NAYTBUdVw8w3qQJW7F4Vfzyw/Ja/VjR9qZ7E/ujx7MuBWZHa4nTJXGB1O2OdkTcLd9E
         Kg5Dch0lNPfgd1khCPJAWSWiQMiA+QiwxWnmed/6P+lFRlvpgd5RhnlHUEBlrYKedfSr
         ZC9/4BrDjT5xLLcz8l3Clv9ukpQ2TJHtfw93GckCGQQfIeXCKF2K2im6YmWDoi+/VUYB
         +VBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ucXa/fHU6DiFEEbNhRSXqiFoOHUZuHvUhyc6Vr1UKlo=;
        b=qJDBv1Rqem1zt/DWQDzzNAk8kWXvYAv0iflGSCsbl5RjTJTuqvGaUNyAqHIHwHID6Q
         WXaGU3Up6sxIcecVujoG53IsnYEsialXPDj7/HgFA6IxrA9ahmsYkEsVXu86sE3RbVf6
         Yq/psL+3KwuNYXp0Wq9P5hH8uD38RJpCbl7IFdH+1ktG9pkrJ8we/pMSleXwa9z0HwYR
         YPZnC+v1lnHfYsOMaH+B4CI14QgOXzoZxDQhawbjCWwFnkebDLslAHbCQrgpFRPHjU7a
         TsngeiN8TwQP4LbySgt0AF1C7x854jINlHV2i57RqPlruDOALSKX+7olHtrBRaPnjV1B
         NORQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sJ7tfrxF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l198si22859788ybl.6.2020.06.25.05.43.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 05:43:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sJ7tfrxF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joREL-0004WB-R1
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 08:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joREB-0004VI-Mg
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:43:39 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joREA-0006kJ-77
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 08:43:39 -0400
Received: by mail-oi1-x242.google.com with SMTP id s10so4574349oih.10
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 05:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ucXa/fHU6DiFEEbNhRSXqiFoOHUZuHvUhyc6Vr1UKlo=;
 b=sJ7tfrxFQxvv+wBgXK/9EHxfZ6UVYL3+R7kJi2EbEUOG1D9Qq7PmaQrYRd1R0OdqKH
 YPOdR3K9lD9+ESjwBGdwHYE28Blx5fbeeOP/LxcQWgO5F3vOYp81S/spVPy+Ml2saKbX
 EjPTVCmTXwndXAK2egSNFmLaEMo+wWPAJYxlgCh9Z5rh0Djui2P5OP7Kiu8D/QqjyU53
 W2N7aetaGSgKEIjYhHdDd/wypoarCEKcoczYxVqNwrocdAq0Evzx/c8hZoFclQLkA3cv
 6XIRrln4JWoxLi8/8vYnFzMYHmIrsYJFVOa5wgUhgnZZhjr1iQ3R3jiBGkqQeRuLJo2z
 92Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ucXa/fHU6DiFEEbNhRSXqiFoOHUZuHvUhyc6Vr1UKlo=;
 b=FWjQPzKpH8NiTkzlRefxf/Rht20JhHgYmqFFWjEcIoc7YJ5u+uJSkYr+AjWdDE10mM
 19qgtVY4Quq/6lakNydguJ/1z5WtbUvSNuFgMIvuWoMPPj8nACocSk50lQkv9nSS+wOd
 Uvo9wpkPzQ64qMU1Rds3a8+6LIpGOTpiF/HMXAQEdmsdbThu4TkTozYIvon6XII0ndyt
 A6/tfDi9G1gHQwG7vYRx+sNKRNS548oYSZlEMzzhVEf1fzfIQLj5pkxA6YbLtGJjOtiT
 LdEasw2aQQCTl8+6qQrJ3IctXXSouAZiqbPxGO0y1td/uYTqdt1yCaV8DuD1PgGN764+
 hx3A==
X-Gm-Message-State: AOAM531ZH+veZxmu6DuqXI9sol80jlcdRIg1wQLYch3QlwU+eMxOuZE0
 AkPItld9hoCBlnU/eqXV6B2qbssG9LhLMQLRotnljg==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr1986810oia.163.1593089017154; 
 Thu, 25 Jun 2020 05:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-38-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 13:43:26 +0100
Message-ID: <CAFEAcA8XbHpi_Pt--4rvAzouLiFXuiGrV+mC4eyQ2PrG32+_6g@mail.gmail.com>
Subject: Re: [PATCH v8 37/45] target/arm: Add mte helpers for sve
 scatter/gather memory ops
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SGkYoa7N+VO+

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Because the elements are non-sequential, we cannot eliminate many
> tests straight away like we can for sequential operations.  But
> we often have the PTE details handy, so we can test for Tagged.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
