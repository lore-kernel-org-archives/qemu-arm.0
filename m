Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3005372ejb;
        Mon, 20 Feb 2023 23:17:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/sijMRxWuhbSUAaN2kzq8qw1mhFU4bH6/Mx/ZmLiMLdG9gqtwKGBZQJ/pkX7FO6DZcq5Sx
X-Received: by 2002:a05:622a:189c:b0:3bf:a08d:b265 with SMTP id v28-20020a05622a189c00b003bfa08db265mr2859889qtc.24.1676963824116;
        Mon, 20 Feb 2023 23:17:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676963824; cv=none;
        d=google.com; s=arc-20160816;
        b=Xl5CDiL/KqRTvYQxf9fBvnefSzRJBArww5hjVTWmj3LbPTx8GfujDAn4G0Y/DyRpTd
         w+E5wiAGR4YQ5MH1kE/+Tm+aeKVCFP2hU3/C5TnJKZiGnHaplYOHarFwfJ3P9odxw+8W
         Xwthmb2TLXdmU1yB89IkcOWJ6UsUyo8AcvnVXGeRUwKA74kQuBcq+Aa466DE/JakqDmp
         KN2Td2C/HTcp4nyCyTiFy83Rp/ECMZmNFBwD5CP4DZnrG+mkqWeMcWa6z/swyO1NXCzA
         ok9dYGF0K0tT8+3s37npI/6wYAdm5zePYlKVPkOKhSUdF6sEl8ZE7w3w0QMkQA6smCI6
         DjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DPOOKiXWgH3HGWD+UPhmbSmDJ/2Vm9Z08PHruCRFhq4=;
        b=c2glpoGfZVqLYLojiSBtVXrmnB6SLpK7PA9B9ZtJ0FYCM/VFmPWRG5/xAkVyJtwgJS
         B5M5nhG114iZ1Lq7wy0yQtbLu0I/FplVN16JhrTEzSWwPD2XWM6CRurxUxa7/85cNM2T
         5yIPnmEmCcIcIgCudU0GIzZsZ+0sq+WUvsbnIh63wJMwUjOO/rn1bZ8MbO1WfUmiLigO
         Wy0J+r39q+ZdAZC4mfT/jgP1TbMEVFqqHQmPmhSQkVB/c2YdqPNFPc53pgOUVQdfcoqH
         7G1pmZ7ulYUPyaEAAUE4WiXVMGH2qxe3O9jxwcDFyEeDiADVihz6Buqscc249gmQ3CWn
         mItg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VWIv5CKr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020ac85743000000b003ba1d2fd43bsi11240646qtx.195.2023.02.20.23.17.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 23:17:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VWIv5CKr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUMtU-0006a3-Jg; Tue, 21 Feb 2023 02:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMtS-0006YQ-1K
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:16:54 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMtQ-0003Zk-H5
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:16:53 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j2-20020a05600c1c0200b003e1e754657aso2757021wms.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DPOOKiXWgH3HGWD+UPhmbSmDJ/2Vm9Z08PHruCRFhq4=;
 b=VWIv5CKr48Y+Ccz6Ca/Rv+f6lsZMoYI4ZZUoaRrzi+kQ2R1MOxE6c3+/pL9Hrjou3r
 AUw+GcTjBwzE3mRzHVj9SOnvEhtgWY9KV81BmfFmXVw/zVsD2RdroXeE/nEbfzSgFyKB
 azYp9xIVmKSQwX8uSwyWEkWvlQlNb9AGoiKIMdEP0JMkpcqNqRCb6Pqe6P6b0+nnQwM0
 JW99r9Xm9r0R5T7HTM/S6hRtXaJivC1VN/M9vkCadKCvAxrP6K2hYx5aikKGU62idHdA
 HO6LaT+HpwITCsfTYpD0RtFCYsq9fE1hB6daeC8NQuQqw+2XXxeI+n9SeTRjbzSyeFhV
 yEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DPOOKiXWgH3HGWD+UPhmbSmDJ/2Vm9Z08PHruCRFhq4=;
 b=390jr01g2HVTlxlJWHKd3HjCafUZdQQa8uHnII+xWzEJIaFdsXW4F8srteJzQYQgcc
 KepSOrAVMBszltK6vKrQwgrlAVV46w9lo/8chupEX2ioSQNAyce97xcULbt1I66TeVX/
 hxH3qgONxYYI3p4d9zDzFaIeMQqCXmAougWWDd8j3LNh1zhSrFBJ8esby7LNGxXNGD9a
 OGHZGCsoB1MNiJWpxagzbO54e7h9r5piyDyRnlsJYFntdHQspmBUkHbd1wn2ArblAbFP
 rbXe5MZxhwS6TGy3QvIYC2fHE8I0jXc4S7ObnU5nle137KMENCnlCuH5bFjYWJ3q6h+h
 gkrA==
X-Gm-Message-State: AO0yUKUIX/eyNz8Mnb2Mqm0P5DNL+8SbqlauKkiydPz54/5Kj2Yrt+Sx
 uwd135aZ4zJwpI8OII8TrOCWIA==
X-Received: by 2002:a05:600c:448a:b0:3e1:97d:612e with SMTP id
 e10-20020a05600c448a00b003e1097d612emr8191193wmo.29.1676963811054; 
 Mon, 20 Feb 2023 23:16:51 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c510b00b003e1f2e43a1csm3272976wms.48.2023.02.20.23.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:16:50 -0800 (PST)
Message-ID: <655f972e-5fb8-98e9-77fc-a6553dd7f8a2@linaro.org>
Date: Tue, 21 Feb 2023 08:16:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 06/14] target/arm: Hoist pred_width in
 arm_gen_dynamic_svereg_xml
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PBHh9KR4Lvig

On 21/2/23 03:19, Richard Henderson wrote:
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/gdbstub64.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

