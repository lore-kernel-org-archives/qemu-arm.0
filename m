Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp180622ejv;
        Thu, 11 Apr 2024 14:01:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWiz8FNwsyM76cQ+ZRVua/D9zDMbUpyRBB+ccYv7sMKXVQlQB9KdzAdojPf6Fgygo+lxXFotEHgAcBdL5+5NYo/OGPGiO0f
X-Google-Smtp-Source: AGHT+IHetAoyat7P4JH2Gyv0z0GGe0iloLVH5SxfIYPWxtoB6yRJvZFdiLewOBFhP1e0CshXb1ik
X-Received: by 2002:a05:6122:20a2:b0:4d3:34b1:7211 with SMTP id i34-20020a05612220a200b004d334b17211mr1032064vkd.3.1712869287802;
        Thu, 11 Apr 2024 14:01:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712869287; cv=none;
        d=google.com; s=arc-20160816;
        b=sLmSEpVxuLX7GBiG6PHNHKwV92mEFBoLIbsFoJas6gZOa/KTxkw14Fb8onAQPYGoXw
         XIE5inZJt5jYShzjROsPv3FrQBbxHNdU2YL7P2VyJe/sQQf1JA4tyelDAI4luzVeMv2A
         IPW/0aUfzffniGmCp5QtOWXo/a+WZckY8QdjyrKwWprP+xQTTq12a/1mcz3IKke8e3dC
         JguVNOvBpG/bVmU3NA9AZP1ti5qlPN7PAClgWwiSMxt+RrS3n9e8sOWCkwmq2ohJiBya
         M4IS4AQZ5wKZkdegeXt4lUN0iKQVvuqoz1u3aM2neDtHth7kqgpZ6QqGvrlL1xJWiFsd
         8xqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sXt29pkqP0UhbjwucKEtZ67MG6cNBqHRgucZb9BU1d8=;
        fh=GnY4QhVdOSOOfwFgGApUYSsICTu6fUg/GxlpJmdf7wg=;
        b=DzhjZWXqffhBGG4u7FRXz4w/yJYJ9vbSZV2kAmZiOO6KuMCEJOUO9pE0WKXj12ZEaF
         M6un5aDrpndP9UO37az8K6pgRrdI/t1mW2RFFkbChtH+h4qheyDkFPjOBQ95pgkYBs0m
         m68NIKgveb7eHDyQCrPu4++e4eGQMFnb3QATokE/YYdylFTFfcrdCh4a9JGhKAx1y6C3
         QaRakmTHmN3dan554iRgav6fnnJzPBmoO1UEZ6F0zTJnh8E30NPHeP1ZnsAwj/38oyUN
         AjUCiSXuh94HF+ramjHs/JPOiLYxD32fKNsuU7ato/dW+j2bbtBdY7Y2EwW0UCPLBk4/
         pWlA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nICLB2NK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9-20020a05612212a900b004daa78923d4si363422vkp.163.2024.04.11.14.01.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 14:01:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nICLB2NK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rv1Xk-0001sN-9m; Thu, 11 Apr 2024 17:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1Xj-0001s3-HX
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 17:01:11 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1Xg-00074o-5x
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 17:01:10 -0400
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7d5e19d18fbso8301139f.2
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 14:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712869267; x=1713474067; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sXt29pkqP0UhbjwucKEtZ67MG6cNBqHRgucZb9BU1d8=;
 b=nICLB2NKJRUyu+KvNwh7oh66n56jWTQKgY4CRmJ+mBec7c2HsD3iTlMP0QyobL3RH5
 62fEZRrXw8cIB+FznrVt/tN2In0hLMaLrV/uwZLwE6kBKWOJtcTrG+I2BjjU3EFSgvKn
 3jbUKUevV/nzQbWoQIc8VEOlVomohsDx67mMPe7fCxrUv9GHPeNHMqNL2qu5/RjF+IA6
 TjJ09K3+4hTNpzzx2xAbDdCK76lis9eptt8wj02gHE7zI3LHT9OxkXwbs57+cnIVIWlf
 4Lz1LGIczUWCfkQtvwaNy4wqeqkQ7D8UOrlzUvOX/Z146P0bEBn/z3p7F82AQn6kACC0
 padg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712869267; x=1713474067;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sXt29pkqP0UhbjwucKEtZ67MG6cNBqHRgucZb9BU1d8=;
 b=f0pLuK06zy6v2WJf1fTMkXfxuavz5Q3q1Ol6MAKJjpWwCN3uxEsq/8xZoshuAS4L03
 XVwRUONMCYRkRY1u75nR73JfwjA10gFm55+SV4W4SlwLSTO60JWeDYsGotTuOPgXoaEE
 AhHxCpSmErqkh1bmhKTh0CemporaGIWwjUD5aNdRCH/kwZTY/wquyS8sbP7ElZ20iB0b
 gW3s0bISMggyIC+NcAs6A1rh9uRc3ZLuk6kmHAEWqdM8b34znLcnHaomNLcj6IpyPIai
 BOu+YPi4E292tF5AcSkZBgTocmY/NT7A5/Fuw1EEZNLp9uafpBBaj4gbvf+0Ok+AUkaX
 Z4EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi9oS1HMDrri8KpzIARkBM4HPbHIzeJWEdCHuPoZ97F4BnRO3+lFKmVEB18rxh8yMy2gA919ltwIEliaijQbCeBfbG
X-Gm-Message-State: AOJu0YwnNi5pXNtUS2ZJcFc+Gvmp8USGkE80gUWjOH4c3JrHdDgFQCkD
 TOlJ5swgxq1QuCWIV2ql75wvwhTgKUhuBTepxKVwWItVrz6/NPLQ4S3anYqF11MXs2JzylmR+UR
 q
X-Received: by 2002:a05:6e02:1807:b0:36a:fe3d:157d with SMTP id
 a7-20020a056e02180700b0036afe3d157dmr873898ilv.25.1712869266861; 
 Thu, 11 Apr 2024 14:01:06 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a631b0f000000b005e857e39b10sm1534453pgb.56.2024.04.11.14.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 14:01:05 -0700 (PDT)
Message-ID: <2c0fa8d1-ce81-4002-858c-41d5c50093a8@linaro.org>
Date: Thu, 11 Apr 2024 14:01:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] disas/m68k: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20240411104340.6617-1-philmd@linaro.org>
 <20240411104340.6617-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240411104340.6617-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qIjkZOqrz5Kn

On 4/11/24 03:43, Philippe Mathieu-Daudé wrote:
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use snprintf() instead.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   disas/m68k.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
