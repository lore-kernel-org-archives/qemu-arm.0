Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3004183ejb;
        Mon, 5 Jun 2023 12:31:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ60RnLFl5ykyK0WwG+Ahzpy4ipW3jcEzTD3DFPPZmRN5sS76MuOo+7lbflY8YIP2hdR84vA
X-Received: by 2002:a05:622a:1747:b0:3ef:3af7:1c43 with SMTP id l7-20020a05622a174700b003ef3af71c43mr9805360qtk.65.1685993461858;
        Mon, 05 Jun 2023 12:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685993461; cv=none;
        d=google.com; s=arc-20160816;
        b=Chu4UXHk+oar773CER/51lgTfPfESK9NwsIhxTmqpHKOojRDunSeIrXdwOq+lbwOwu
         BZr3wqTTIIV4h1Tb7FkCddfK1YsXaK3r1CYqs0+o1Zo0VmbXB2wy7K3hJOAy8L7AhuAJ
         VXCl+gbWkKrso3lYas61rz1Ay05CiETeBXFN8DmULKN5GC1XGhsrA+vaJPYfGJMI7U+4
         2JYraIzr7jlTxEHOw0MbvpmhgRAuQGFZMNjPb7doKdtjDMPAI4u1cIizKjIUjzPqKDS1
         zt7gdPhtFQNHsVtrZ6Pz/uwtyTiiIB7c50UQ/G/Mt4Nm0Lcf2Ph0kEdAxAFcRp9XkpB3
         3Iqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9MnhiBF7aAanVV6mGfK9uoXanxnyXOYa9JVTYilCb+A=;
        b=SavHFSocUU+ImMhR6M1q36YN+SvdOYIb6iabeCfy0WdM2EJ0Pzw/hsRGdbjVe3Hhd2
         lo2y9vu60WRvXq/57pC3WFfu7MVRG4Sn5FdrGiJkcrSoZbEQqZO2z0X8gzqW7GyrQitq
         IUau3vW83Ku5yu79VlY9e1lMl2BwyPTJxdERJYGHZ++35aNtWLmJYJIveL7ddKvepsTd
         yagOB0D/0bNZi8L2UCwyGRMVxz1azVNiduNxmuOueePoH+Bo98B5BgCZ7vCOZfwC9io9
         /j0jmY/EBvSwIGaLVN6LHCRbOmvGNVt9dw0+7SAao79hiyeATTq/iYvSQU+CxVIll3Nx
         bf/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YOiAWICY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16-20020a05622a15d000b003ef2c5fbda2si5110120qty.640.2023.06.05.12.31.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 12:31:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YOiAWICY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Fuo-0007d5-Ly; Mon, 05 Jun 2023 15:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Fum-0007cl-OT
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 15:30:52 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Fuk-0004uG-Mz
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 15:30:52 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-652426346bbso2661526b3a.3
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 12:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685993449; x=1688585449;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9MnhiBF7aAanVV6mGfK9uoXanxnyXOYa9JVTYilCb+A=;
 b=YOiAWICYRXJZKujPYR+lOqKoCaJhBKVjdbV8Uez579bCIEtyC5Wv6OxJyckDTyZZml
 ZR/BBpE23M6RcIZnf7myw1i4tKYLnAOq4taMK+iGZc/mYZy9W4LBA15AkIoez4cKUn2u
 i+OU5cuNfWQ8UzpxV3LHe16ErZoG9Sa0KOoDmtm980UHqYXxzavkoq517I58YV/SPTRE
 ru9tajgY30Y/dVwdr46eSb5wpNP0i/2Q1VtsE5nedACe1Tygshr76EPTn734X55MGXYX
 zd9pX+kql8ejW2yy5z+UYwKyHSsXfBIO+E4fp/1drUbMG78U1k9tJUh0aIeBr1XJsy1H
 sTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685993449; x=1688585449;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9MnhiBF7aAanVV6mGfK9uoXanxnyXOYa9JVTYilCb+A=;
 b=Yk1cPp0vPu4v49GONGVllXDUDWtvGl7kp4T22nlZUXpspH2X/fm9P4SCTPRQz1+W5N
 gKCk2tkWHHV2lt7EFMeMw/rS/bfpbRvb5mwLNy+4Jp1j7CPIlJOponL05sWh+73Fdt+8
 QE87zvIoXgNG2s+C/18AKjmlUDPOkuKEEsoKY5w3wc89VwhhKMerZbSV7UG0FXUL1W+D
 oilfA7f9WrCCs71vjPmNsxxcqjq2dkcBATbJfBDIDZfgFpxFTMb4EnG1u93QS8WO1fvL
 LQGsfx9oir7da/TfT9KzIpP50bqJAwraPN3tpb2WAYHIVOCHWhl8ykt+lGFt9ZS2NxTs
 L9VA==
X-Gm-Message-State: AC+VfDyZW9h+hCAkH0z6ifAjFlUC2bIkXTzYwoktUyY5jRC5Urf3gDud
 vlOclf85dd2/H06+vEWpATwzPQ==
X-Received: by 2002:a05:6a21:78a4:b0:10f:3fa0:fd8e with SMTP id
 bf36-20020a056a2178a400b0010f3fa0fd8emr26013pzc.27.1685993448703; 
 Mon, 05 Jun 2023 12:30:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:3f85:a600:6a3e:e465?
 ([2602:ae:1598:4c01:3f85:a600:6a3e:e465])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b001b077301b15sm6951529plg.156.2023.06.05.12.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 12:30:48 -0700 (PDT)
Message-ID: <7b03c13b-5a6a-f415-4628-b9254c8cfb74@linaro.org>
Date: Mon, 5 Jun 2023 12:30:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 5/5] bulk: Replace __attribute__((noreturn)) ->
 G_NORETURN
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>
References: <20230605175647.88395-1-philmd@linaro.org>
 <20230605175647.88395-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605175647.88395-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: /EXIlSOtDpeA

On 6/5/23 10:56, Philippe Mathieu-Daudé wrote:
> -static __attribute__((noreturn)) void exit_failure(void)
> +static G_NORETURN void exit_failure(void)

I think attr-spec-seq ('[[noreturn]]') has to come before specifiers-and-qualifiers (i.e. 
'static').

To me this means that G_NORETURN being redefined from __attribute__((noreturn)) to 
[[noreturn]] was a glib bug, since it has a different syntax.

Therefore we should simply avoid G_NORETURN entirely.  At some point we should be able to 
update -to --std=c23, at which point we use [[noreturn]] directly and not G_NORETURN anyway.


r~
