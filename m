Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp123946lfo;
        Fri, 4 Mar 2022 15:52:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZnzrW+Joy/wPtKcy2GNfWfzuL94dSru9HyZcJEqi78+yn3gcUXrbjfKAZOkjtHS0DGxtg
X-Received: by 2002:a0d:d6c5:0:b0:2dc:4056:502e with SMTP id y188-20020a0dd6c5000000b002dc4056502emr991519ywd.82.1646437963146;
        Fri, 04 Mar 2022 15:52:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646437963; cv=none;
        d=google.com; s=arc-20160816;
        b=mWr8NdFoutPIhXo3Zy7N6hIWIm1vK4LdKZIiWhCRlWd2hPbXDRfJ6ncdejiVfKc3Hz
         fWdrd+BYztEdZ9qbwSuuXbFum//T4LHIfrrdUk6rETWttvVX/yFxlIiOTp8cexIT6A7Z
         /QSf1rzBJ/NFf2+sKGj6KopNup7yUdKEmOgD5XYhDgawW6vi7xGsT5OBlY+DmOXYyOFK
         uwcD2CzoEc4VSfzsbpJ36Uy8D5adlYN7u25aD07sW55dDz9mjtN/KJ4tOMd4CDffUpVG
         syfbCQYvK9XXVl3JZ+zKJkZfWK/2Vr3W2fVEzwSLvJzAAhlKkF2SZ08tmVIrFt9vMV/8
         Hlrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=KhJf++smB1V8NQssT4pZZQfcG1ZDHuXc1GVhlQ4sx7k=;
        b=1J8hv0lzjfS510f9ByqQ48A72JDVX2oDsFbmnQMI1PWec/n4XYMwUDXNdZIgiTxERT
         DCTOXJpd4FjHureFpl1QoffjgV1RKpANQr+djLQv9QBKUou45+ldQHSwPccG67vzFnFn
         uiVNAUzZzyug3op1yKn42L5ldCNSfpgCC3QLFaLQg8oKZY7RDpU7beMLJbHMotuBlTIU
         kfD3/qPQL0k84lCZjSxsw1EVboA3euTUQbRVLa6vJrcibzxeQJJGCh3Paj5sUDjPmeRX
         yDTEruSjmJAFm3qYyrxzV65bgOllr/qIimS0wEoimROy/9zPca+tK0/M209ozS9gPDRC
         hXdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=kPYyw7Yv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k81-20020a813d54000000b002d634c231d4si4648157ywa.6.2022.03.04.15.52.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 15:52:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=kPYyw7Yv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQHj0-0000lE-Ig
	for alex.bennee@linaro.org; Fri, 04 Mar 2022 18:52:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHiq-0000kY-BR; Fri, 04 Mar 2022 18:52:32 -0500
Received: from [2607:f8b0:4864:20::62c] (port=45802
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHio-0000RF-UL; Fri, 04 Mar 2022 18:52:31 -0500
Received: by mail-pl1-x62c.google.com with SMTP id s1so9077884plg.12;
 Fri, 04 Mar 2022 15:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KhJf++smB1V8NQssT4pZZQfcG1ZDHuXc1GVhlQ4sx7k=;
 b=kPYyw7Yvrr+q5Z6EmmhcxrT5eK84RwWjZwx6/LOWCcAH0hyOIB9QXiJ9l8GdboVASE
 yC08Jh4OOVKk7npjvbTXvSGCl6gdJ/myTiEhonIIPH5WcGPwyclHsooAY2ekRZM6r9bg
 JrNNPrRzX+RSqUWLZmzf0INoaxerTt5U7BTZ4HE7naAAWeB/oLzGaQVbjJn+UNvUHPta
 HYhJ0KLQLq8EjjTkQosvjkbTZi4Qxts8+c9S1J/U7WWhiJCcxBhkDwcdg+NI8O7UXNW1
 p0sHMwzCiIohpq4ZSl28PPoElEiufsjrWH/MGgZcs2V95kWjh/IPDuNCWuQc/iM0nTR5
 bRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KhJf++smB1V8NQssT4pZZQfcG1ZDHuXc1GVhlQ4sx7k=;
 b=SUYN4TNyD3n2+WUTo5wRy5YYWWVZ2vIYHJBXGN14G1NsGledxFEQ/CIKQ4klqOmDWL
 oONkmn6qH3GqrE6QrA4RY6R+CWsiA95JEDt5GATTJOXXk1+PgchDGfy9WYUSY/FsZsXw
 9vwJujkBpLbbQksA/VHb4H8TVUoU5AUN5moLFUDzmfU3qO9ax3HVs41rIQjebFbnhmWw
 gU5VYS3qo60EWgDoWNlkeyGkq38zxwmCJMzxlY67gzhbCDOc3kye5oV+wEVlJbdv/DrO
 b9wI2GwKWm/QT3zQLU1X6KVijVPomqS4wdHUmUnHcY5xXSyk7hdgi7GsjIE9xnZJsCIR
 UtnQ==
X-Gm-Message-State: AOAM5334fpoLTYHdgvcwKxjP5V98iRyp6seEZaoTRHN6Gzj7gTMEes89
 4wMIHVRZBLGqRccMS2dyMEU=
X-Received: by 2002:a17:90b:350c:b0:1bf:1dc5:1c3d with SMTP id
 ls12-20020a17090b350c00b001bf1dc51c3dmr8366446pjb.53.1646437949077; 
 Fri, 04 Mar 2022 15:52:29 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 rm8-20020a17090b3ec800b001bcd57956desm5488198pjb.51.2022.03.04.15.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 15:52:28 -0800 (PST)
Message-ID: <6a47e93b-66e6-66b4-b980-8c2447a49429@gmail.com>
Date: Sat, 5 Mar 2022 00:52:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 5/9] hw/i2c: pmbus: update MAINTAINERS
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, Corey Minyard <minyard@acm.org>
References: <20220302015053.1984165-1-titusr@google.com>
 <20220302015053.1984165-6-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220302015053.1984165-6-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9iUfGvdTpTYm

On 2/3/22 02:50, Titus Rwantare wrote:
> add self to MAINTAINERS for the PMBus subsystem and related sensors,
> and set PMBus as maintained.
> 
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   MAINTAINERS | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

