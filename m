Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp609266lff;
        Wed, 16 Jun 2021 11:45:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTaTICpob8nOzymi1zI9OVu2KV1F7PaTPt189BREwB8jTxWyBqzDck9iEhXnG6ztgrfZAm
X-Received: by 2002:a5d:59a3:: with SMTP id p3mr601316wrr.284.1623869149242;
        Wed, 16 Jun 2021 11:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623869149; cv=none;
        d=google.com; s=arc-20160816;
        b=zTW2RutGAbBKf4OjOEwfZiyztjfNo/2aMlUCtbG8cZu5yQSpzL19xgqy1JsQdkVuRP
         acCY90lpGvEHR7f3sEI3XkJUMVvzt29Fo6Bzk3lfyY2mn+uhI++uLvQWnAB6XEeb0tZx
         btjJMWo4E+VBWxLV6zmK3Tm/gWMYDKmLI7vd7dw3fK5PbQfHw4Hj+AD3cuY5Rk9505t/
         fGIyXX7XFE0IiMYVGmdcAx7CfPFabMUr22BHHjay8seXz3XrzTB+aS0VEckk6KxZp8il
         oaA/4L5wGodaX9U67RARNJseDJ1OlOQ9WW+qiasDp+tF6W0VQBECRYrzVuoJikSaul8I
         WiDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ARnL0PW8TCH/ZG6xb5AyyXDtjLpXNuJfQVScRNQPLXM=;
        b=Ubz5DrqKkeU9vP+zqSGksZPD41MHTlCHJDbC+imLSfzjHuZk/TzuGBDqrVSYCMBkgz
         DS0TWqbSc7le/Y2ytFQFS9HrGjxuHFc/nfnI3YGjKxZcj8t9R2zVhoj5BkAXt6FZ/blw
         rWdcwndV8Bq1TGTvaIAOl3+8kdLX4VWK3exDtLVHuRD7FhrVRKL2ZvO+NgJBAQRTRmjF
         RdH3ZzHXBPNeuhAc3YnABIEPEYKxPDbQ60c+qPOdeKTYADsZ49Vp5SeN6FoR9H7Q8eyz
         hcEu43SKEBU+5QzLsVEZovuHKEdgZ9NfuNjL2onhgT9B9JYYcaHQhnPapME7zSNOUUm/
         5XOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DH+1gVvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si3315471wrd.473.2021.06.16.11.45.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 11:45:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DH+1gVvp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltaXs-0000dn-7j
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 14:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaSu-0001FL-OA
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:40:40 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:43698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaSq-0002wn-5V
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:40:40 -0400
Received: by mail-pg1-x52e.google.com with SMTP id e22so2700846pgv.10
 for <qemu-arm@nongnu.org>; Wed, 16 Jun 2021 11:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ARnL0PW8TCH/ZG6xb5AyyXDtjLpXNuJfQVScRNQPLXM=;
 b=DH+1gVvpnONO2+0VdvjXRe6nWD3vJJIDNje1gLpi8E/m4njt+VZ/lTSwHKG216LQda
 hW+lx2OeVndkhjRuZm2+9vGAFBzPzeJ8g4+VQTB1zMenqMc6vNSJv89g2+HTbSZFIhow
 jDr3ql97H/wcgMTBHlGmv2lWlNvW6GF00+Hd+MAHy8/Gk5O8BCqdvQhbcwsj2v+9Nz4A
 k+9uR7G3iryjPcKUowfuNEmIY9JoAx+47MwEaMkNYW8P26FeuBbhne30o8yX4urWjwx4
 +wY6mPnm93vgFh7bST/730CvsKuO0PyLCH0FYWmJLG6zyzdCxJzmVfnAfoQukudyGkgD
 4LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ARnL0PW8TCH/ZG6xb5AyyXDtjLpXNuJfQVScRNQPLXM=;
 b=ZnFM+VP4n4jS5KT6XRlp5BNGHrt5wsmjnzArfF/SKO8LVa3UlhoSLEomgzjWH0s2JV
 h4A0tWAjE13kt1DA5TxrgCOgSkbor5KQ5l0p7guNdL574YEBFO6EQhFvqQDt2II4I62+
 CPKe/BfGuWYH8PLG9rgwi2Sq0RJXwTktNizq6GrGl9qLVvr+exU9MO1BqixDWG+nOsTT
 1wejo8/jPBLkO0KO8UL44ZY16kWyYw71kkOzhULOev2aHSpX3NoBWItMLLu3hhOhNVPi
 HH0GTgoK3Z2Z6Opep0lCsAL4yidw3fajU+/9NqBOs2z8Xs7BaCFnkyL7wAOOmEIu+Dbu
 gSuQ==
X-Gm-Message-State: AOAM5327fxgUKBjdOVetOai+zvy5HFDye2+3Xe8Gl1KSl1hLbkgR/hz0
 HUnxk8f/XmbHGpIHFNfuoqpimA==
X-Received: by 2002:a63:64a:: with SMTP id 71mr1002006pgg.360.1623868834346;
 Wed, 16 Jun 2021 11:40:34 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a23sm2696587pff.43.2021.06.16.11.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:40:33 -0700 (PDT)
Subject: Re: [PATCH v3 05/13] hw/i2c/ppc4xx_i2c: Add reference to datasheet
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <94a02a64-d8f7-d77c-797c-0d797ac7fe10@linaro.org>
Date: Wed, 16 Jun 2021 11:40:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jIRHcMbmL48r

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> It took me a while to find this model datasheet, since it is
> an OCR scan. Add a reference to save other developers time.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/i2c/ppc4xx_i2c.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
