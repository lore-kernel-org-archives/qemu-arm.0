Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2865886wrg;
        Mon, 17 Jun 2019 12:15:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyK/hJAhVquU84Ph1HpL9GnMpZ5wOXd2efT8/d+ZbVtJotDxw5T3U3CauZEBZYY5aA9iwfp
X-Received: by 2002:a17:906:5008:: with SMTP id s8mr60668884ejj.308.1560798908556;
        Mon, 17 Jun 2019 12:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560798908; cv=none;
        d=google.com; s=arc-20160816;
        b=ERa9uQiFgw8KsYgQhvvhihTNmPfixcRzkY1cXLqsJDjdzEplhwzfI/a8C0ual0UX0R
         Xv7q3FpyXZa8eUPB9ki9JoHfCzD5tbv9oBbZdYZi4eZkP9tE7HcZlvnv3W1+mwtLbXQD
         AF5eb1qwi2crByAxCmKF+PAQwTOWn7QGbSm6So3S/m6LeyjU57ccIL+Brt+ZnnlFPNEV
         3Bj4+/w5+bTkF6FgcVpNqemgaRwnuiOPcfq8osZZ2+1PsXwfvuwLjgPhBNvqlR+40z4X
         IFF++rRQNXEO0tpMIzC0uAcChLG0VgU88qgd2AACevF+f3GYxstNrCYVJdpgCSJQBasx
         2uyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=iZHzBIb+2T7t0rnvFVP9Ixb3KVylrfKNn21WvVXuJpw=;
        b=IytCfE8AKDY5wuGsr1YhvrhyKNIe4Jmn+bUgQ91qXlfMUvtExe+I50ZJRixc4L4HWC
         TE2fK/W2WdiTNjB5skLdTW0ovZkQNbGJtn/w+MYvzwc4ulIfX/bF0QvC5gjgOZ2zCJ2j
         vcQv4FFaU+n93+EQXR4Su6mNCjEXjjXhQA4ldhVgjmJ8hEfDIRgPxNzbZjgETZLzTuBL
         QzfMrzFQ8g2P4BUB/Va25wNAWAIcg4lolwbfQWRoNeBXZ5CKa6JpIrL+YoMEc9fD+W0M
         AsFBiJ8ViKH1GZMJpbcfnkau+MQXHBlZw3s8ZIfQUasyt/bQb0pXh2Bti9iRad8HBKEd
         cqOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kql0QhwS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e27si8636905edd.353.2019.06.17.12.15.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 12:15:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kql0QhwS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51364 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcx5v-0003Tg-Js
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 15:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44307)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hcwuc-0007zd-8T
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 15:03:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hcwua-0002jX-Vf
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 15:03:26 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:32975)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hcwua-0002gs-Kg
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 15:03:24 -0400
Received: by mail-pg1-x543.google.com with SMTP id k187so6322614pga.0
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 12:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iZHzBIb+2T7t0rnvFVP9Ixb3KVylrfKNn21WvVXuJpw=;
 b=Kql0QhwS5l8zAR9vPZI7vrtQq1OwB8FP8vycgIHYqabKVPPUGprCKXDCBaDejKMYq+
 +FAId42zOBwxMYPIV33lY4urr4ox0XYjzi6ZqPB3yAQsC6x0Fmaimnzsi24S+SQrhwOU
 3clk7KTmJmgKXKv1cWYHgpURFmy3NMaSwBoRWad6znW/SzNWumOFyENtgR0d7WbaRmlP
 Ic+UlLH+PeeoSj3+54tIMfgpT+L7NG0gTTzBDgtwTZ75PjVLWrYlPUeeK0X2owhenxGx
 u9pi79gDW+vdUfbmkh/Wp2hIg6pnyWWvoY46AWoSZC+dFHyOCGDayUwYVvNlsnAl2Hpv
 2KSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iZHzBIb+2T7t0rnvFVP9Ixb3KVylrfKNn21WvVXuJpw=;
 b=GSvMassOI22NY8wg8UKZpl37wlFSMvkWLaX2+45Xluhsni8/esxERI8yhi5i1LbZqt
 X1MTmarNt+H3r+bO3EB1pRinbGBt8PEXjz9+kR9oB4QjnMoQLju2MSlyOBc9NO5rQ8PJ
 G6GHhkY/w2bBaPrHEl1hSqqoB7C43t8OGdnWmLAM9A5Lk9sLNoPdd3IL7t4kcqKGPBCA
 teAXKYy65Mxnc+CkFEJk4sPyn9dSV9c5+O2LItSWnhXPlAfKmZGVxR11bcv4UjlJvcd5
 QtZgyw24n8hLeT2Tb+5vc120qhyjggc2lAAuQ2zICabyYOR3BYbYz7wcBW/nCZ4VgxId
 Z53A==
X-Gm-Message-State: APjAAAVUe71YLcgIbeWe2AgF1u04QsJw1S2qLvrBPaUxRr7SfBETJ2TW
 OADhTlU9WsTnA55DR+DMLYuaXA==
X-Received: by 2002:aa7:8dd2:: with SMTP id j18mr45558585pfr.88.1560798183183; 
 Mon, 17 Jun 2019 12:03:03 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id 128sm13061319pff.16.2019.06.17.12.03.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 12:03:02 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190617160130.3207-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ee659698-d2fb-8fd1-dc73-baa7b63a94ba@linaro.org>
Date: Mon, 17 Jun 2019 12:03:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617160130.3207-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-arm] [PATCH] target/arm: Check for dp support for dp VFM,
 not sp
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IUiDQaRJy+jK

On 6/17/19 9:01 AM, Peter Maydell wrote:
> In commit 1120827fa182f0e7622 we accidentally put the
> "UNDEF unless FPU has double-precision support" check in
> the single-precision VFM function. Put it in the dp
> function where it belongs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I just merged the pullreq with 1120827fa182f0e7622 an hour
> ago and then I spotted this bug in it...
> 
>  target/arm/translate-vfp.inc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Oops.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
