Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6555216lfb;
        Tue, 28 Dec 2021 07:58:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJ4nk1sdRXTSSBfsdEqbVN+RMc9MRC5XXv88rjZuwQS7ZjOcRFgV6Qx/LOX+jHxFHWLKxq
X-Received: by 2002:a25:b17:: with SMTP id 23mr21863106ybl.463.1640707103289;
        Tue, 28 Dec 2021 07:58:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640707103; cv=none;
        d=google.com; s=arc-20160816;
        b=DbH2981NmnyC1MP7sS/oMNuDBqsF95V0+xpr6fdYb0yabaO8ltqhnfXECuIAkkvQLZ
         sSDot5Y2EYz0Y6O1RVquCk6wmiREXO9bc8Ub6hWmWd4jFXt2/ZQ5KTs6a58jCG9xgj9y
         PhOW9BGsjZt2LLES1SW4/osjO3Rbdr/kw7GhccvaGZD8772KRpbzETyEsxINmsOlIu+A
         WFwtLudGnkvgJtN3YGKksmNynPXZp/9d1JRzYgfDlYm/fQFdULVEEpDAGNr5hIsoV3CJ
         wukTPDd+5gxLzGfyXnK9jQY68oDEKPjqd08hs8TL5+i1OYhJRIcostWJi76Ktutq/dpf
         +FyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=9+TKXXn456JTKpa2QllacDt3a1HqFcgf7yI3+X2lAhw=;
        b=0qLHSXoFy2mXTPc/nhEQNOM7YXuDvWcrEc7pZbZPISGfL1s+Ket6zm066e/421uSzG
         YBLl8fOCpNooDpEaKIyQuVrcwyjipq5DZjeHU9hYc5rkDTrpU/4aBfWV6qeeBZdbcYXS
         2Ua3CqUWw64bJwg0kJaTY3Nyo9yS1LxHRF8aluCYU3UdFm3Gn+OXsoBBUgD2oALfdS0Y
         PgblBx0eoeFr93nqFCZo1asu9TiXJxHpFmWt6x0rKhjtrPhF2jyCdKX19QDduOdhj29u
         rMDhilDW0nq6AN5WmjXLW/ULDLPCXaCuv0FiuzSUQDVq5fUIHythW63LJJkHhTj8KxJt
         vHLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eQwHQ03j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i140si7755414yba.194.2021.12.28.07.58.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Dec 2021 07:58:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eQwHQ03j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n2Erm-0002J8-Mg
	for alex.bennee@linaro.org; Tue, 28 Dec 2021 10:58:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2Erc-0002Hf-UO
 for qemu-arm@nongnu.org; Tue, 28 Dec 2021 10:58:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2Era-0006eq-Qs
 for qemu-arm@nongnu.org; Tue, 28 Dec 2021 10:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640707089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+TKXXn456JTKpa2QllacDt3a1HqFcgf7yI3+X2lAhw=;
 b=eQwHQ03jdPqIHDoe+m6jAgpTwCVV1AyI5No5ZkYpMqfq3oQS4r1ig/0kk4ek5viRNjh8/o
 Ml59WNEN9ncdp9wGjNOe7cdPKyRqB/sOZ3Pe/NboQu1x7twhmEAVGS/cy7Zthy0ZkokhIp
 1FLjy9ft0FMy+brW5rm4iMTlZo35ss8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-Njfhnb5tOlK1kNvPYMmcOQ-1; Tue, 28 Dec 2021 10:58:08 -0500
X-MC-Unique: Njfhnb5tOlK1kNvPYMmcOQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v15-20020adf8b4f000000b001a24c46d6ceso4011301wra.15
 for <qemu-arm@nongnu.org>; Tue, 28 Dec 2021 07:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9+TKXXn456JTKpa2QllacDt3a1HqFcgf7yI3+X2lAhw=;
 b=ifrfGCFdRQ8rskQRFmJmQUx0FVbEYzR/ysKC7hHN0rmWyDy90DFjN+5dSU39XDeU7+
 vzsWO0qX9eeFRpJRZZPinqzfJkBDQKtGO7Ucr8epPRdg2EfTc4Dc8JkiYouKjFhls93W
 XWHRiwI4uzt7EZy50fWwBn+XxErOBDtOj1coFv/ISPploBsGsuReQxhmx0efiogNT7Fe
 ruDDmDbd/xT6GDSR4/M+EhNmTmbefgVCCkUX8wKsYY4ONk2eH0rKWJ5nmlJ3++DvyzC1
 3qcp/rB4HC7BTtzXXpi3hJZYxS9uz4BzXvKqbw673LPqlMkYKi69tTTeY+Bdw656wX+o
 n6kg==
X-Gm-Message-State: AOAM531fe5yUCFclXrExOqNqf35ffgLsAf6NfyW1InGFvZyIF1UEv2k0
 9QWbgiO9r73nlP0EsXYfMPF2Tw4Vr+Q5xJwjdY2wA0cGFiQL5sWoHxp7RfZDc1+9oMrLDqrB5U4
 BgbUCnt/1pmL8
X-Received: by 2002:a05:6000:1085:: with SMTP id
 y5mr17462665wrw.696.1640707087194; 
 Tue, 28 Dec 2021 07:58:07 -0800 (PST)
X-Received: by 2002:a05:6000:1085:: with SMTP id
 y5mr17462641wrw.696.1640707086985; 
 Tue, 28 Dec 2021 07:58:06 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id c8sm18384343wrp.40.2021.12.28.07.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 07:58:06 -0800 (PST)
Message-ID: <10e4c8af-e09b-4777-9670-7a5090974514@redhat.com>
Date: Tue, 28 Dec 2021 16:58:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 05/14] tests/unit/test-smp-parse: No need to explicitly
 zero MachineClass members
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-6-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228092221.21068-6-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.573,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5KoXW16EtDBv

On 12/28/21 10:22, Yanan Wang wrote:
> The default value of the MachineClass members is 0, which
> means we don't have to explicitly zero them. Also the value
> of "mc->smp_props.prefer_sockets" will be taken care of by
> smp_parse_test(), we don't necessarily need the statement
> in machine_base_class_init() either.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/unit/test-smp-parse.c | 10 ----------
>  1 file changed, 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

