Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp5120131lfg;
        Wed, 12 May 2021 08:32:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsptC88eudPeweYQCdzUaWoltwXC1zA9UV6UV5V0fZGY90YRXUPkhfwzIajVCLLCMu5Ezz
X-Received: by 2002:a05:6e02:1ba5:: with SMTP id n5mr30232195ili.45.1620833563326;
        Wed, 12 May 2021 08:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620833563; cv=none;
        d=google.com; s=arc-20160816;
        b=E0ud0tSqxJtIKrrBPYiZCxD8MJHupKAGUmxTOL5lQRWXJvKXW7NA2G9PenezK+PGXg
         Tz3eP5/ltN+P5JGG0ykVeSRIIcvmlO5t3JNAx0fB/aRhj7PPs4iJ64Undab0L5fk0iUx
         pkc7e1a+tLHKgZHJDuzjdrLKiN2AVmFe3dRoaQbs8df+ZsD8zZOoIf8SSm3UF6wRoL83
         1f2TLRS7VO2QeOkkeUkL2B5nM5G4ddlOqWrgUELuH687ovrqhZVUyH7+waBiK200Z/Do
         QZHDY6Ge697ibyRpVsu/2CvTT5CIxGE7r1mLUwpKZYb1X0YTPXuq4hdk6D+jkGg8e6yT
         yskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fzpxr/EA7yYE24S2wHQnJAB8JyY/qA+etwkIXcO1lYc=;
        b=PBA5++oNcLT4ol7qnxbTT3GmohjlDEHoM2w635e3UFfaArNtD0TY/fYzJ+taK+zt21
         hlh64W9CUumt9ME95EmTxtLm/Ew65COHzrJ1SIIvYpFYKZIO474m/4C6VV+Bp8F2hs22
         UyqdnMx1/v11A2UEB6AOiPUhBURNOgUCw753tJ+6qIb2yHjPFaVF4WdMVdsiz3ti5Nz2
         qX8TKAjgKOVll7lOAceIg4Tf9AnMOMX+f0Sj/6WHJLOty9ihIySLw5LuWrlmOZhRRR1G
         2zl7S02Ix4wjYg1r8jmsLzGMqwWMfnZ9iqhPrB93kmzphSpUV0igXha/FtI/BZ5baojN
         YyfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iUde20x0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21si257307jao.90.2021.05.12.08.32.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 08:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iUde20x0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgqqo-0005U3-Lg
	for alex.bennee@linaro.org; Wed, 12 May 2021 11:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqko-00063P-I4
 for qemu-arm@nongnu.org; Wed, 12 May 2021 11:26:30 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqkk-0005WX-HD
 for qemu-arm@nongnu.org; Wed, 12 May 2021 11:26:30 -0400
Received: by mail-ej1-x62e.google.com with SMTP id l4so35591206ejc.10
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 08:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fzpxr/EA7yYE24S2wHQnJAB8JyY/qA+etwkIXcO1lYc=;
 b=iUde20x0hZBKpZlX/3y5WWOVCKqhN9Ie3oN4VyBjp8i/SQDacWu1WErv+E6lYT8765
 m5qMgWPVznikCdxhx+r2lyomRztoLUAklJH3eQRtqEuGQ1Z5yhh0YyBtsnPL6+JF5IL8
 aDV4Ae3PRptLWXvWcHWByYc4hEOFh/AXdMCOLw0J9q6Gbce/t4KFDsQeT9TW66i49e5F
 gGRnFnE6Cyf52StNP+lkUkT7EBSzlX4UCNhLtb2cka31LgFSP5MOGCjRC+iiikCzW2wn
 aXKCyjSZmFYn69y5yShviB5bACvcfToUGSg5DB3NfTF9CPtFyeDNXlxs2CgiiVfbMicZ
 wf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fzpxr/EA7yYE24S2wHQnJAB8JyY/qA+etwkIXcO1lYc=;
 b=BQoKhoxP5SUj8HeUAva+3t6zhSqnsPgL23JzMPQ8Put8eldbEkk2RJor/w76IJ8ksm
 1b8kOKsvhjRtpUQ2+bhVphhDx84KciJ717uUOGi0gatK9b53l2+cm0KkMTTyZC4aBBkL
 8kYI1XV3yxX6kanGSm+RaffPDOQ13JcYz+qYu+COQkSAWXxDuKseOZjfeFAXc8+P7zLQ
 93k1a644na1ptS/QUaDy6ebS5tXolzO+J/IUQ52Lh70nYZODzbngihMiTKliaUJuc381
 gPMyKtVyeigCrLVztlghTBgHgxpDvV8xaRu0g1h4cE481I21OJFhcoH0PYu74ZmGMKrB
 2FPA==
X-Gm-Message-State: AOAM530Qni6hbjxQYdS5JXf7ERL0dDzF6BJZ+JnOmOBxbavFnj/VIMSO
 9Se4338LcTumupKtFq7bNWKoO9avUYZ2Zn88Cxq5RA==
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr37894081ejb.382.1620833184927; 
 Wed, 12 May 2021 08:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-42-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 16:25:11 +0100
Message-ID: <CAFEAcA8BeXAM7fHb5EzS65__ubRL+6aUnEpMK+7tpS9af+3SLw@mail.gmail.com>
Subject: Re: [PATCH v6 41/82] target/arm: Implement SVE2 RSUBHNB, RSUBHNT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k9tSF6eIM1Bt

On Fri, 30 Apr 2021 at 22:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> This completes the section 'SVE2 integer add/subtract narrow high part'
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200417162231.10374-5-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
