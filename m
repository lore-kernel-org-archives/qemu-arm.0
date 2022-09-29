Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1145957ocs;
        Thu, 29 Sep 2022 09:34:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6FmLD3E6jLuVeVXHxpjNGV1Ilrl66Slh4hbl0AYF0QH8bJ2TWiaiIspSKikxM7DwXaK4BL
X-Received: by 2002:ad4:4eac:0:b0:4af:8718:3b55 with SMTP id ed12-20020ad44eac000000b004af87183b55mr3262088qvb.72.1664469248776;
        Thu, 29 Sep 2022 09:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664469248; cv=none;
        d=google.com; s=arc-20160816;
        b=RFqV5NmgNYL2KbFGJ5iouYDGtD/8yXZhy5lWzvaZTRGbZ8rfr7QA66Ddoph0pWTvGR
         Wswzifp6uCcpwWMAznLQhTdNQ3jM4GUolnr9C3/IgqkPbC7b57rM9w778Gxh3wHBeF1F
         N6qN2uSV33AOvEkjkF0ukp127AlaM/fBGKP8oBV5j4FkEFi1xY0HPUnOFrPn5q+z/0v7
         gD39ajnffb8cwAEdhj8d+dO57EcxM8BM0VluKWZLj8vq+FHSFIA9gL1728Z7vuXvBpL1
         xwONIVFMgbgGJoYgvoM3SROmEJ/6x0KA6EQZpQXNsH9zH+iURjYfmqEkw2u5hDhsYFhh
         DSuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CF7N2QdSA+nvsY7t8EBBPqYz7jMQ76uSwvDfIMTeGEk=;
        b=RzRxErZqOz/vRKU4Xn1Lgy+a2n6z6T8jsK673vTJln4bO0WF4XenF5PIyZtwtexVsc
         D3PYS76fIA24uiIzbuZBnATNRBob+RWeX7nxhWI4NaUgBJwXeoEKLM3POvqHkr6oX59Q
         /j/eKaX51an6Ce3U4ijv3jWAP2oDtK+scrIoBvMA9yjfDYdtSldXcPvgxmciFoJj/6N0
         xzDc0b6jq/WJf19+a+g1SGxNrCXmP+ZyhOCnjlAEPqpyG1brnxffHvSgXRfp5H6dV0yj
         eosPB1MgfaQmAXSGoC0GhQ2i/X6HBbPWBNovRcekaNttosxdMx1SFhVVeam/YwIPLV8D
         lcCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=liUPnHKR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020ac87c8d000000b00344531031d9si1278939qtv.341.2022.09.29.09.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Sep 2022 09:34:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=liUPnHKR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odwUC-0005vj-BM
	for alex.bennee@linaro.org; Thu, 29 Sep 2022 12:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odvMZ-0004qF-M7
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:22:12 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:39709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odvMY-00063q-2M
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 11:22:11 -0400
Received: by mail-pg1-x531.google.com with SMTP id b5so1736352pgb.6
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 08:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=CF7N2QdSA+nvsY7t8EBBPqYz7jMQ76uSwvDfIMTeGEk=;
 b=liUPnHKR9cnuPFrddy1vmnTtHIjNGxKlCZHUDlCIE5sohvrY2sUO7X2Y5akVSdUElE
 sQXBcu4rVujcdY/4YWie9sFF1/aj21a30YUIICIQ6z2TUHbMrU3eJdazipLQKxX3cVTE
 gLXT+MxOM7VL2VrxMJqWr99YaewPUB3TtTmgIkadWZDZqGMTkUrt9QJwuPmbh5G3Ygbi
 /vj8h61hNZZ2RoQBSb0bqG0VtVk+fs7BWFLGbwU85bv7K9Xrn+DxwxwQqU3qs9h6CWEX
 RgoTH2Q+JXUzfYXjhGraDNsxzTIn6d5z6Y/GBvOMcUbTyFeWuqrXQCNqe5GD2iX02FwY
 2tmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=CF7N2QdSA+nvsY7t8EBBPqYz7jMQ76uSwvDfIMTeGEk=;
 b=hmROz1Xkm51ArqzqjgGYqO+JVfUnjtgFP7jABqFtgq+igrBiAhRdSmoRsCTzYJeagd
 ebUiCoWaqcrLYnDKCRa1Tfz3qAoZCZBPwLyAO5S2vcQD+xIeBJv2AYgSwvPjAPOl5QFa
 3ljZO7Bc1Zo9GFiWY8OR5FQNlVSR7jvD7u/SaW86TaySsptkJj1of3pu+qJdUdN3Blmg
 ImZ+mWX7P60ZukB0iX1YtE8eh5OQS5yMbPYCVIipoVHSXjsUnjYZ/MlzfDpSNeOxhxI0
 S4lMzu5+oOCT+M27E3LJUNKlmuKC7bv3TWEsOTHQ4zYNMVe0sLybfJnZQ2sxzBJqEq6V
 0hUA==
X-Gm-Message-State: ACrzQf3rO2cT2MwpzPZ0A8C5Z4sA0NPHucrcVgLkhYDm26RxLi9WAwvd
 aVBjQvi2almO74WkEdVYvZX+6A==
X-Received: by 2002:a63:3e0e:0:b0:438:63d9:930e with SMTP id
 l14-20020a633e0e000000b0043863d9930emr3386992pga.17.1664464926267; 
 Thu, 29 Sep 2022 08:22:06 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:d5c8:ddf6:4bcd:e3c7?
 ([2602:47:d49d:ec01:d5c8:ddf6:4bcd:e3c7])
 by smtp.gmail.com with ESMTPSA id
 b191-20020a621bc8000000b00536aa488062sm6232590pfb.163.2022.09.29.08.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 08:22:05 -0700 (PDT)
Message-ID: <12117a96-6b68-3146-3576-261228f15203@linaro.org>
Date: Thu, 29 Sep 2022 08:22:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] target/arm: Disable VFPv4-D32 when NEON is not
 available
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20220928164719.655586-1-clg@kaod.org>
 <20220928164719.655586-2-clg@kaod.org>
 <CAFEAcA831iWjFSYt3UrKT0zA1MBfJn5BVSpEbVrOWj3Yw6yn_Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA831iWjFSYt3UrKT0zA1MBfJn5BVSpEbVrOWj3Yw6yn_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.099,
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GTc9ar5+KZy6

On 9/29/22 04:44, Peter Maydell wrote:
> Architecturally, Neon implies that you must have 32 dp registers,
> but not having Neon does not imply that you must only have 16.
> In particular, the Cortex-A15 always implements VFPv4-D32
> whether Neon is enabled or not.

A15 requires VFP == NEON in its configuration.


r~
