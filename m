Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp349515lfq;
        Fri, 11 Sep 2020 15:48:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRERWIq8+DkKC5u+cV5CEVjRx9LZMpwTel9HsEAYP6QdXMU/QFM6odSwoibzzZZkCQcQLl
X-Received: by 2002:a25:32cb:: with SMTP id y194mr5460886yby.464.1599864503958;
        Fri, 11 Sep 2020 15:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599864503; cv=none;
        d=google.com; s=arc-20160816;
        b=iIC+hR0eOvIC5p/qsfkSf/NtTcNIrzwu1mvcCUFHJDZ1lkCRmilesBr15GAJzeNXHi
         ZnGXA0HU0/TrwvwbrnUOjpkl1uhXEV9naduKAxCxSQkGH9HQOScNR6vd7bccuJLCTwOH
         9bSW1QZXGdmhoqlqYz7uceIYFhPU4r1JHZ82LNTAeEuoo1ZguwwRLmA+u2RXN/cCBpx2
         WoyfhuSNeK1lH/MBMtfftVBSoX+krTsxJcChKHJ5kOFxQ366h0Z9I554ItWJfxnLKNlS
         gGuw8QTJVgmckj4ugB5/KUNiyOXjxY0Xu7r2+6RMEbzXUo/oBvMQflQzd2j1HOQaJfNX
         0SAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QIa1gYMd2982R0r1MVBdCj1U9OhtTqhpoj4DQnzfJrM=;
        b=PFgqTNbYbGhlGGLISpE9th1LqEqbng0m5aJbuArGjhELJIGlrZ6RHlD33sQHTE5wV8
         m8JnQw1hCt5YWB8MS5CQZxCKwQpvjkTPROg2e3qi0bSarr50rQKgHgRKSwCvO5WtkDG0
         iT0N1yvEhaWFsWT3N0YbIFIclWiBWKr9M/ng7S7OXZd7KaUa+rNL5V0Wyu2/0m1s5QTP
         pfL9LMBQeREdR3pIPReUMhq663J+oUXuBV5OO6Y3eiKqIUYX+IH6tl11S3glyAcWg9sf
         IEQhRDjqF/AU0PfKhhUkU0pERWMHJrkq3YwB5htiIKNN9lylBj/yno2GXO81oTShh7UB
         PQgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBVfMgCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si3159522ybk.200.2020.09.11.15.48.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 15:48:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBVfMgCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGrqB-0004jO-CB
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 18:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGrq2-0004ha-AW
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 18:48:15 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:38101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGrq0-00016X-Na
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 18:48:14 -0400
Received: by mail-pj1-x1043.google.com with SMTP id u3so2355745pjr.3
 for <qemu-arm@nongnu.org>; Fri, 11 Sep 2020 15:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QIa1gYMd2982R0r1MVBdCj1U9OhtTqhpoj4DQnzfJrM=;
 b=VBVfMgCeFHxPo3vPFCGpABujuY16lam+Hl1MDZpbhjh1mhaEyb+3fejaEbBu8oX9mB
 y/uZEp9V7PNVeAJxC6tJbzCY7Nfs9gwjMt+84vrlC/INlI24VOPk9TI6T8hF4PEAPpQB
 reWQ44xNXObgjF4Rbhmi2gnJXMctRHwsJXLTp0gLuRHcnQilDZAVCCgv2ot+eywf22dh
 WkA9bCEV/hTUb0aauvp4xQyzpaUNZJzMegfmuIZNc4JJx6sruy3MDOwPDjlliDvQHRMd
 kGQ49UErx3JG/aMovWuj4nKDRDdCTlBggKiuAMOXX61oroFO+zCv7G08kB5nKkx351kg
 N1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QIa1gYMd2982R0r1MVBdCj1U9OhtTqhpoj4DQnzfJrM=;
 b=ct86MaIjpEZ2h55j+OX49kDrrAuiL/4Lmm6+917zklXojq6YqUExgj4f+7sk2Qh4q1
 RUZC2cOT1Xc/u2jcPnmUBQp2ML7CYJNOKKuUsH0iKwwNUhs3yHJmSnAtKP7uXQ6v9tsg
 S0z9R3QzyIfYSzWu++fYXwb9ZKltv+W2gFoUcu1nrzjyYu2xgmVSbLRXsHr86tWANovt
 VM5sAmbXAiAwzCjPDCv0aU57Qhbs+nzlB3iOm1LRPNo+9vUCkYMLldFA557jphnekHzf
 gGjQWwFiHZ6uf6KXf4AAIJNSyeRSw2uo+YjCVfkhC+a3n4aoFWe+osZqknX1pLDwicV7
 BNKA==
X-Gm-Message-State: AOAM531hvqAtZg+aq4QjNSmsqrY7xGgQyWZa52ZPunPff+q8g05fxrbO
 DF/vndpjy0qXMPlxlqNrFpSgAw==
X-Received: by 2002:a17:90a:cc0e:: with SMTP id
 b14mr3976206pju.166.1599864491471; 
 Fri, 11 Sep 2020 15:48:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id kt18sm2776896pjb.56.2020.09.11.15.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 15:48:10 -0700 (PDT)
Subject: Re: [PATCH v5 7/7] hw/arm/tosa: Replace fprintf() calls by LED devices
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200910205429.727766-1-f4bug@amsat.org>
 <20200910205429.727766-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4adecaec-b777-4b53-9890-5b88c5122f63@linaro.org>
Date: Fri, 11 Sep 2020 15:48:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910205429.727766-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: apMPMLTYukyE

On 9/10/20 1:54 PM, Philippe Mathieu-Daudé wrote:
> The recently added LED device reports LED status changes with
> the 'led_set_intensity' trace event. It is less invasive than
> the fprintf() calls. We need however to have a binary built
> with tracing support.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/tosa.c  | 40 +++++++++++++++-------------------------
>  hw/arm/Kconfig |  1 +
>  2 files changed, 16 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

