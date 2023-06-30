Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp705234ejy;
        Thu, 29 Jun 2023 23:08:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHmJXpw1A4SjUeXz7x5KbK0HMRUglpGa1hTKmfTXX5JQ1JDvygBmwniHCTrK5HEzOKJzIvq
X-Received: by 2002:a05:6214:173:b0:635:e81d:e57d with SMTP id y19-20020a056214017300b00635e81de57dmr1659999qvs.55.1688105321805;
        Thu, 29 Jun 2023 23:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688105321; cv=none;
        d=google.com; s=arc-20160816;
        b=dpX1rJ/drjc21mas19B7xHiCa6lTmN0G46BsOrIJl6WEmianFRKyXlE9DZWR9Ko8JL
         AnJTHvwYGNHXFYoFnCdJXqKfF8rMIzr89raDkTZhjVzuoavcjta8LDtIOTUQ9VWXHeSo
         whX71Uvv/FYvlc7FIYTW1ZaAnqdqLa8PEW291ugO3z1PaUhLxKdlaraJHkzojct908PP
         mPQbCe276k8WYDhpZkBW/XXPEXagbe+O9qZk4OEsWL9A8qV/oklX8ZrtoB+w6Pp2jYSJ
         S1GkjvG3O1xpDqg3sMu6gCZL6+to4HLNO8A7V/VDEFTWOqhPB6oFeXK++ye0i6aSIcEX
         TTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=/jwwVfIAEOnlZlHBVuDUvoZxsmdp8fvM9GM5dhKwnjM=;
        fh=Y9WyUE9c/0SpEjy2J0iXIhae35HMBX5FBjKZkiXR6/s=;
        b=DhJTBiMoDAHcgUUUEYkeGCVYTt4vu6EVsPARVI+8R0MXeTPCx8kpeXvKtj/SeA2LeE
         r9/uoKdEkoZzX8zzt61WVlQS4FIo+Hb7guq3qmTCpBRyCbvGMx6qi5tttnfbeB4u89F6
         mi/RY/u+aqWSyhy4Z5UkKJB6QtqD0fVWnerXB4CsWo0nJ3ui9hv3V6Tm6XRr+jMpeNLz
         cXjicGzi9NZvrRvmI2wp1lt7cAawbEpOWJJYLm3RqcMWm7EWtwRHlmKh1VAjzZECmzkI
         od8Xs9g5i+cGuYZeYNhlXb396y3hIqSId+HMA90FzOUr1NFs3vwGKjT0rh5s7HDqpIVO
         BNjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8-20020a0cef08000000b006300118fcf3si1922596qvr.605.2023.06.29.23.08.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jun 2023 23:08:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qF7Ip-0005zM-Ht; Fri, 30 Jun 2023 02:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qF7Ij-0005y0-P9; Fri, 30 Jun 2023 02:08:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qF7Ih-00038l-Kh; Fri, 30 Jun 2023 02:08:13 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6D05E10399;
 Fri, 30 Jun 2023 09:08:08 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 9FCDA10912;
 Fri, 30 Jun 2023 09:08:07 +0300 (MSK)
Message-ID: <fb410a2b-bb4e-60cf-2dcd-416a957900ba@tls.msk.ru>
Date: Fri, 30 Jun 2023 09:08:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH qemu] aspeed add montblanc bmc reference from fuji
Content-Language: en-US
To: ~ssinprem <ssinprem@celestica.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.a,
 qemu-stable@nongnu.org, srikanth@celestica.com, ssumet@celestica.com,
 thangavelu.v@celestica.com, kgengan@celestica.com, anandaramanv@celestica.com
References: <168794501779.28884.3336012012258765799-0@git.sr.ht>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <168794501779.28884.3336012012258765799-0@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 1CmrDVj4piCM

28.06.2023 12:09, ~ssinprem wrote:
> From: Sittisak Sinprem <ssinprem@celestica.com>
> 
> - I2C list follow I2C Tree v1.6 20230320
> - fru eeprom data use FB FRU format version 4

I don't think this qualifies for -stable. Unless it is fixing quite a serious
issue in existing code in the process.

I'd love to hear some comments about this one.

Thanks,

/mjt
