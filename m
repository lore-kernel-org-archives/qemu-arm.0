Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1551062wrg;
        Sat, 8 Jun 2019 12:42:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydANPA6WBJuIj73s221cdOT9cP5TwI/w70kbsoSDDxEg5j5ksisS+pBmjlnInOcwu0Jge0
X-Received: by 2002:a0c:b659:: with SMTP id q25mr48144495qvf.29.1560022944869;
        Sat, 08 Jun 2019 12:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560022944; cv=none;
        d=google.com; s=arc-20160816;
        b=cF/hzpNP2gi284Aq3wui4HZWfhavl6y8hu8Ds4cBlwbpgMFShh/lbrF1W+yl/GM8E+
         txHpM7hTI0Cq9uh6M9S4lZHk6AtwgceCYSoRxZqGv7Co6WpnYdOqLeolyoEApOJdNVRo
         Q+2l8VzU/oHHHnm2ZgO1wazPIfmnbOO6KDOvCawdnVZLBl6lTnJCGMWQYOXWPcpNbwcJ
         e/MzLJgH4ZrT17xGdTIP16pyw/fVn7YwEYOt8SF0Fkcz0wjbzqqiEt/W1b5Uc2Tfzy0l
         tzpGRVOkyfDB1fh0XephlQIlqO5hwtem1L+98ZnjZpQzgz8KT1DkbAepV0rx9b+5X58w
         DdFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=eFc3z5Zi2+P0zeUhuGfQxDe3HZ7k941fCcKiMMtRH/k=;
        b=M8lIXss8tQ+huoGRp3afELCnh7SzhyTpblXbmuKk0j+nAw2ZRmRa97abZgr41v39qI
         7Qy0J5KyWujCnPkJKoWE3vHdfKKO+SfR/6sWSQHFkjltuvlMrUYHvLLDBBxBgtrM+BvU
         DUerj2CO8xN1aKrLG1AVywlACyEO3yS5PYrEVEiBqbJIW9rTzbE1yEWQS9j6O7zynK3c
         Riu2RSkzuB5AfhYVPNaROPmrQl0iAxYsixGqVBllB8OaWjdolPuqstiO2bSBCme4N+g3
         x5DrstsoDO274nIQCoIC54lVe7ynl7sM3IRvArbDToouCHBPd4g/YJzyxCpo6lwVi7L0
         oP6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FBc0s2QJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f40si3661909qvd.222.2019.06.08.12.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FBc0s2QJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZhEO-0002yR-Dh
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38303)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh2e-0000QS-7q
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:30:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh2a-0008NJ-RJ
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:30:16 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40580)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh2a-0008MQ-J1
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:30:12 -0400
Received: by mail-oi1-x244.google.com with SMTP id w196so3710165oie.7
 for <qemu-arm@nongnu.org>; Sat, 08 Jun 2019 12:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eFc3z5Zi2+P0zeUhuGfQxDe3HZ7k941fCcKiMMtRH/k=;
 b=FBc0s2QJHCRxomeQd3ePhmcKASoj9tujP0O65W1/0EjTa43INgOy83QFNfE0uCchDT
 EDr2sLPn/pKH7MrJ9C85WNcGOv1SWOOu6Ezkm9/Zgbpilt17CljUdH7ETT/wfG785sFB
 mo7qppQJ/vxaA3eefnghv3njVSjRTgZGNVNuHPLGLYy+bCst8IKyPHUVeIJFdgfAE5lH
 0uqQLTT535oXzCX7fvW2B5U3QzvVXjVptvleA2P+CtThSf+hz9Nb0IyNYi8FAtiVimnI
 kpnIglCbFIdzjxN9EAPztbH1Qt8oS+7uSqBmOwiwNlUjgTUNspdhctUw7IBp3uBldNhI
 MfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eFc3z5Zi2+P0zeUhuGfQxDe3HZ7k941fCcKiMMtRH/k=;
 b=PP3EbVtM37b3xBZV45OE4OpiqS0yxftC7LLEIslvur3le/lmhbpCPGqfEuRammQdWL
 MIW0y7Fsbe91BWMV5LdnBnnSiim1k23vUrkQF+2eJbdXsQPH+DEqKBknWIlFefvwaLij
 /EftX5n6k0DZLDJ8ugpUaaOvXhR6BmwSd7G1Ojfb59qaOkxMcWHQNNe0pHZfmWlKsjwb
 f7IgTxpZ0F1ttXa0ZJn+KgEmQTzKhydAsvqN/C1xEfw+VaEhPvZ51Qm3z2fdJJVpAopi
 iAM6EFmfUhQt65h4Vs8FBGHdGvOWCGs4zsX+CugbfuDYr7Rmj7htL4sJ1krS1t3W8o5y
 sAmQ==
X-Gm-Message-State: APjAAAXwn42y5QSlam6GEqQ/lryf9je+WAZ6E8Jby9RgOfxZUX3Jjx1y
 jqiVLAvESpU13u6gt3f6Inul3Jp7Pt/dyA==
X-Received: by 2002:aca:b456:: with SMTP id d83mr7918848oif.177.1560022211814; 
 Sat, 08 Jun 2019 12:30:11 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id o32sm2255158ota.37.2019.06.08.12.30.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:30:11 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-36-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e29659da-2b0b-71c8-6500-d6612fc254de@linaro.org>
Date: Sat, 8 Jun 2019 14:10:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-36-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH 35/42] target/arm: Convert the VCVT-to-f16
 insns to decodetree
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
X-TUID: TmfXgHOxwRN/

On 6/6/19 12:46 PM, Peter Maydell wrote:
> Convert the VCVTT and VCVTB instructions which convert from
> f32 and f64 to f16 to decodetree.
> 
> Since we're no longer constrained to the old decoder's style
> using cpu_F0s and cpu_F0d we can perform a direct 16 bit
> store of the right half of the input single-precision register
> rather than doing a load/modify/store sequence on the full
> 32 bits.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 62 ++++++++++++++++++++++++++
>  target/arm/translate.c         | 79 +---------------------------------
>  target/arm/vfp.decode          |  6 +++
>  3 files changed, 69 insertions(+), 78 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
