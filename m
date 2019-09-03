Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp277636wrp;
        Tue, 3 Sep 2019 03:49:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuu9SLDlYxEKDE9GveMauqj/niKONhRC9dKuOEAe+mVwPC2xNebMd0H7l+vuExmtSV9H4S
X-Received: by 2002:a17:906:8317:: with SMTP id j23mr4593151ejx.270.1567507757503;
        Tue, 03 Sep 2019 03:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567507757; cv=none;
        d=google.com; s=arc-20160816;
        b=bcOcWmTZ9/c9IB1Adfer42982BLcrnPr0hsaeI9GZGSaKUjRu8P4euBGPccGvlz0hq
         z2FlLVrfpTWc+FiF3ypbIO4WjFDq0AwnpkkhWm+Om2DqnpsZXtucLytFxll6R6sh3qyE
         BXOkm75c/ibmNUAVWKHnjnhcmgC3Krj8MeKe8w0/tKYYQYr+KlFmKNb40WqSEDhaSMGY
         Scu2GbECi8GW7OTs9eneRTAjj2YmwuJ2Q1OpvEnY1qflhvcfUc3zqLZI3NuDzCVjfZJ1
         SdlDCc8LoinRf6BO6Dv8VHP0chVKI/laRk7wkpfO/U/Ku8YaEvLfIJIpOlZty/gdw4mg
         rewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2NCjEkAN1zVa36SssDRm1NeM5Tqfks6N/TgYK+vg/M4=;
        b=rj6/FnSGC1dNZjV4NWgTZia9I6PA6oXy7i7FwMbNPZ/UbRWhaqDyopqBPsjAe3Y/Xf
         Z4FteolfQkBWp0Qnp97agrMiVp71kb7m4fysHG8Wjii0mWZdYhQhiSKyFZNt74ayTiJC
         2Pvkzh7SXCanY/Tpx092Og4Qd+vkqCywdLycPHhz5r2z/Mo8kbT0UA5PW33oFY6cFOb1
         30rY1aAcYyENJNYBRxJ7sHPvO1AkGrL8oQtxODdzLxDIuPuTnLbF9awsaw+CGPwS0HQU
         5cQ7BQwMANBS1TBEx+3QhVOh+1zKFUzShIlWz/bt/VvhkJqlUhcFF8iGelc/tlz6Rw2F
         f8/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nyluzt6a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x30si7766771edx.174.2019.09.03.03.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 03:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nyluzt6a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i56NA-0002hN-It
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 06:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46810)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i56N3-0002gz-6Y
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 06:49:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i56N2-00052z-Cj
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 06:49:09 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38592)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i56N2-00052h-7L
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 06:49:08 -0400
Received: by mail-ot1-x342.google.com with SMTP id r20so16252567ota.5
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2019 03:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2NCjEkAN1zVa36SssDRm1NeM5Tqfks6N/TgYK+vg/M4=;
 b=nyluzt6acPPR5x2bAMNRiZQJqDZlDoHE8amp/5wBsDAQIgAkNVIX+0AuPbGiqZpyVn
 4ISy8qAN3T7cVUUWZbMyjVBY/chbNsXmgImavhsL/qYRD2pHnudO//6BLwKG1QZcbszC
 esqtZRHHO+cGnDZVKPpPrI4YXgKf/MovFwx90wnKctRF678QUxqkE2duPPPnU2YRlhUB
 2NRCWIS+UteinFjgJnDwM4EPl/2zRRNF8bWG45FU0NEvh1z7CzgoinXMuRt6mRnKKWDy
 HF1JgT20EpJjcvWflXNv+FxUhBuPDQDatX5fldAy+l7hV1Huf/SJqUpOC0c0dCQzWOvQ
 YZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2NCjEkAN1zVa36SssDRm1NeM5Tqfks6N/TgYK+vg/M4=;
 b=Tk57jyIQIQKGpW62XAl2qqpWu9MgJFWdsJeKOEnwU9kC6OaUNldTHWCZD9AkTsrpFB
 ueqWFPZTWbQxSAgwvPcoLIJ/qk1mQw7pWo1pEQQpZNedjI+RbFinIW2IQhDARZOoaJvM
 sv65yqyIg6hFwDIfKQeJX5CJJi2BlLMpB7WgGaAu876ayYSTVQyOpCAKmW63hAxJi1rO
 Qt4Pq8WW9cW30BMHJu6Pn8u2WOmXrr3HBf0RbVpmBw1FU2QNeeXPSGQ3hw78pF6o6PEJ
 4LqqKIpuKiL8NFHqbleLM8ZlTmJ2k9LeomidD9FhRuQ2Zhho0wPbFz5otIZ3bdlOHSoe
 BNHA==
X-Gm-Message-State: APjAAAWvjNAQoMaJXIS3y+7K7eIQ86ju31blA29f0NZRLGzMVD79uVS7
 ekuBO4upMFD3SsmEVSwyRa61sy+Igib5lQZNgK2uyw==
X-Received: by 2002:a05:6830:1bc3:: with SMTP id
 v3mr8733078ota.97.1567507747415; 
 Tue, 03 Sep 2019 03:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190828190456.30315-1-richard.henderson@linaro.org>
 <20190828190456.30315-20-richard.henderson@linaro.org>
In-Reply-To: <20190828190456.30315-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2019 11:48:56 +0100
Message-ID: <CAFEAcA-wJM8VbMf5gEw41b9ma-+jVhoY0d9S_Ag52Pwrc1i7-Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v3 19/69] target/arm: Convert T32 ADDW/SUBW
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: knzkUOKZ3/0d

On Wed, 28 Aug 2019 at 20:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
