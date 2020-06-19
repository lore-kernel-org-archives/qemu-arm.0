Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1045428lfm;
        Fri, 19 Jun 2020 16:41:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoLKjJ9L3Z/A8qQtC2yd5nJZ5TICsxqgSGQCX+clvJLVR6S5cNiM2V1OA7AgB43KZJduPv
X-Received: by 2002:a25:34c4:: with SMTP id b187mr9764012yba.88.1592610082297;
        Fri, 19 Jun 2020 16:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592610082; cv=none;
        d=google.com; s=arc-20160816;
        b=qpclhcfnhixJ4g2UXxTt/pQ5emmez32qpDZhTfUNQ9zsAKE7DYsXmMqG3J9t4A0Wnc
         ReBCf6lUJ4MfsmyN3/3DpZWWS+44fYxenH5HRPC17Z2XbSnZUh2WSGWToqejDNIsxJMz
         Fb9kMp7xg1lnJO2tE/dZ2tZVGZ6rifdJKsMew2ndHVIG+gtLtIE/uzrsndJEBur9WSQa
         Qkf8aas7Gc/JS79z9shWDpVZfEzqO0KKDYqMPsxeUj6RI/9XSM9soD5dFa0QGvut7rau
         oSvLorMSemRUpLJfATJq083hYh1W50ifpPeBJ4EEWlh6MjhQtI/0L1kbxYXB0sasBWiB
         e7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=reABxjRR8Y81NuGMGmYFxj0MMegGnfcMQCByrhaY8Ts=;
        b=xvbUIjMVhtuEdDNoD56slGW450r7XE5ZCgQ7Fk7qCHGrpKluSOMwGz03q5xlJGsiKT
         tQJ9SYciWvwc4QozMUH5qB1CtPvsp/Dp4g8/mu5gTXnTpGsxH0MMOwQwliuMOh/Ob9sw
         wA6WvyXjcbMk71kcqOPdaS9RtPeiFcZq8TCSRTFKC4AQyD8LAzNBad7e2OcIk0uARV+k
         7LR+OKuO1Qh8leudGmL/SYS2R4eHOIHcg3QR3D1c9qr3FutpE6c37YSLRDonm+2ThGMm
         mEBfcUkj7k010l0p4XpY65F9ZGsz0A5LG91pkc4zjXXAFSt0O7FfATDd3v87SGcOXhDE
         XCLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UnHzpdYa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si5904544ybk.260.2020.06.19.16.41.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 16:41:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UnHzpdYa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmQdN-0004od-Mb
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 19:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQdG-0004oW-GM
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:41:14 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:47079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQdD-0001tk-5E
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:41:14 -0400
Received: by mail-pg1-x542.google.com with SMTP id u128so5159109pgu.13
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 16:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=reABxjRR8Y81NuGMGmYFxj0MMegGnfcMQCByrhaY8Ts=;
 b=UnHzpdYaV6YRDgZJB1EltBVhVis9AZRHbTJvbIll4+rkm88ZuHqCR9TWl5CSOw1iwj
 L8+szEjc8dnkvQ7XFRXEDEJmHmsIN+NzNyl/h+IWsjzW/o6pj+nMt5WOYshfXbq48z4X
 1fDhgbhoodBBjPibleyBjqj0G4D2ZcJhsQzy/sMwv03++wkkM90KiQr2q+EHeGqhwsfU
 ShW2sqbBIxiHkN3VquTrtI/Lks/eookKRNZ/pQecwhCWqNXQtszhTV/KfhM1+2a/R7X9
 lvZFD4ano0hnIW+vBpyhVMaf+3JjfN8LiXvt+bpW+Waupdlre2OUqTUTOTXO9Wk4GGw6
 WHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=reABxjRR8Y81NuGMGmYFxj0MMegGnfcMQCByrhaY8Ts=;
 b=DoofqKJbRCVmIup1j1HImyY/c6Obomh24gJIFZ9hV8JMVnQVazB0C1gJqvngybrD5v
 3HIOGsKAeygCWOkPpAfN82H5kSLLrIfrUTPIMHB14TVyO37aclm7xMUujr4+7CqM2qPM
 ZNKyZ99VvuabL+Nmr5nqdSkBY/MONNtDKbeMOlbUXBDezJzGTT6Qr6DQprTgrhQS/wbK
 ZakDwu7ITe76xgtZDRWfzVHPwc0lRw0tE3FoEjXN916cDnT+IlR0wztblF/3n/SKdKxA
 RGN6OaukVMwgIW9jyEQ7B7+PfVeVXLaPY5fZX3mNDIlcYZxVCpyrp6veNJxNxXHoK3BR
 eJBg==
X-Gm-Message-State: AOAM533VPw5kncRRxaqcNI/775Xr859TV2NbVQCcPSWFOiK77OT3uAbv
 RoDStdEz6QbS3RpsW2pMbsTXtw==
X-Received: by 2002:a63:6643:: with SMTP id a64mr1881598pgc.246.1592610069616; 
 Fri, 19 Jun 2020 16:41:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id k7sm6771606pfp.84.2020.06.19.16.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 16:41:08 -0700 (PDT)
Subject: Re: [PATCH 13/21] target/arm: Convert remaining simple 2-reg-misc
 Neon ops
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3ea70fd8-2b15-8335-27ac-0b8948de43fd@linaro.org>
Date: Fri, 19 Jun 2020 16:41:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lMWRlaZCquIT

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the remaining ops in the Neon 2-reg-misc group which
> can be implemented simply with our do_2misc() helper.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       | 10 +++++
>  target/arm/translate-neon.inc.c | 69 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 38 ++++--------------
>  3 files changed, 86 insertions(+), 31 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

