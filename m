Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4873537ejq;
        Fri, 12 May 2023 08:26:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7i9R120fSEPtA8IdcDCI/OcydkZkFYpqgzNVKdat7tKkwmXCI1FuDZ4XdzMIbaoOhTpZMi
X-Received: by 2002:a05:622a:214:b0:3f3:9509:c9e5 with SMTP id b20-20020a05622a021400b003f39509c9e5mr24951832qtx.22.1683905202369;
        Fri, 12 May 2023 08:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683905202; cv=none;
        d=google.com; s=arc-20160816;
        b=pjtk96tKITD5o8+LpyuekTFXF3GL6fUsCS/cSrcTvXm+NekiqbyOgoeKKtWMS4uPCa
         tSuRIcpcxBefEgggnZdGMJCNSA/kn/ibLx3G21sihQOWEJCaCLB87MFSDrLp69PDYkLm
         NIUlZnRrLir1oJlKMWNUxEmdbeGfrHraZBXLodBuIp0rP39jD4Fds7CTyFhSYS/aNBwK
         iqHAAx5p/+ye2u1VwmTEFzUceeziaQqpbytNwjdIcN9KcbmU4ASwnuCyL0NYZ3gszj57
         8gcP42RqS9/j4CT9FsFzUoqgtpjvWAWjBJvOKEukryhyG2ge+cobbk23XxQkTDaEB4jY
         qolQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5oF4xfYWKx7ohG1H++O9nXnufAUukqJafajHx99DlWA=;
        b=V1p8fP3GADW+sxbxoVfUgYCBRV1H5eRo9KcrQhPJVNQ6iPF3S5Xiomz3EStsH+s/Xs
         ga3p9aQQ7dqzM71AnAJCcvw++lo8/wnPS5opY4gpbsWsdGNp8zW7KS3BAaM7zgPOg7tZ
         OGQjL2e4J4eZGhYDnzs89wqs5oAHCwt/AruS52xSTbF0PGE2ozjRMnJ68H0Hc9kLTNAU
         PQWBTbk6u++skck8swvC+vWFFRbRUFZV3k/So6/GnKlxhLW0HcJmtw+MUuHRAwjUv2aq
         0hYf1/gC4G32w5NxzIDspzr7HNNFCVsTnGNXJVpvhq2BFsMKQ3l6Qo3Z5CPLL0YxtzlS
         pgcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CL96DP4b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4-20020ae9e104000000b0074abf21095asi4078911qkm.726.2023.05.12.08.26.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 08:26:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CL96DP4b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxUfA-00013b-E0; Fri, 12 May 2023 11:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pxUf9-00013T-LJ
 for qemu-arm@nongnu.org; Fri, 12 May 2023 11:26:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pxUf8-00051U-8g
 for qemu-arm@nongnu.org; Fri, 12 May 2023 11:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683905188;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5oF4xfYWKx7ohG1H++O9nXnufAUukqJafajHx99DlWA=;
 b=CL96DP4bsIeJHENCa2hcNCm3S6TZitjkC/llsSYUaxF0jsSKKx8TlhzjJV0Uy99AVh8Zo0
 GpDvBtVwONEfMFxHdnHtg098MboVaVO6nii+M7sL+LBmrUgOufjcsEv80wkPDhmTQnXw/A
 yUD3NI2TKOkRtD78fdEYj7zw7VqMou0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-LH3eXQkeMPORyxjGPYMDZA-1; Fri, 12 May 2023 11:26:26 -0400
X-MC-Unique: LH3eXQkeMPORyxjGPYMDZA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3078b9943d6so2696243f8f.1
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 08:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905185; x=1686497185;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5oF4xfYWKx7ohG1H++O9nXnufAUukqJafajHx99DlWA=;
 b=JRlPhW4LftjHTZXVj4+8MkF/XduBOVwMByahomLx4ej9l753VH2ASwH0AN04UyQZej
 Knv4QdQgEmX8ktTqsDif9hXZwei1W6Bmx516m8BvUmHbaG35Jed/V8RPSWeJ7pBZQvKd
 h8zpMAC1659mn5kWu5pJk7uR8QG6MrTABfZjEHUb9zLDSt8OnZKSle94CA6VA9VT4c61
 ryyWI7McZYXEJoZiMs5HpKsi7VnBgNMnHElaWM+9yM9AwBOgT6no7RKB4pAo1L0WyExM
 oK8nSctwCvx1qbMe8Ib22C4/WX8HejMLzwQ/g+uRerBS4Jx7+Ef3cW0m483onFjxjDzA
 qzKQ==
X-Gm-Message-State: AC+VfDxp2255t0p2iLPzieMesPlGolX/HYxni+ojY/tz6pOOv66GFbbQ
 /FKSD3gRfshSjuL5GGNY58SnZXvZ9/NiQ9AF2BS3r+YM6J4YAd+xRkmQHjOqUlP44J3P+xO5DFY
 qzO+B//qeOCRx
X-Received: by 2002:adf:fe05:0:b0:306:f6c:1063 with SMTP id
 n5-20020adffe05000000b003060f6c1063mr17995228wrr.38.1683905185043; 
 Fri, 12 May 2023 08:26:25 -0700 (PDT)
X-Received: by 2002:adf:fe05:0:b0:306:f6c:1063 with SMTP id
 n5-20020adffe05000000b003060f6c1063mr17995216wrr.38.1683905184756; 
 Fri, 12 May 2023 08:26:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a5d65c7000000b00307925ff35bsm16895909wrw.49.2023.05.12.08.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 08:26:24 -0700 (PDT)
Message-ID: <4037a5ca-464f-0798-57c9-74ccdb2c712d@redhat.com>
Date: Fri, 12 May 2023 17:26:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v3 00/10] Add stage-2 translation for SMMUv3
To: Peter Maydell <peter.maydell@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230401104953.1325983-1-smostafa@google.com>
 <CAFEAcA8=sOzRW9QZqrpsLZh6q_erXmj2xfazfKrgg_ESR8Fy9Q@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA8=sOzRW9QZqrpsLZh6q_erXmj2xfazfKrgg_ESR8Fy9Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.845, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nsDan2Z+K1YO

Hi Peter,

On 5/12/23 16:46, Peter Maydell wrote:
> On Sat, 1 Apr 2023 at 11:49, Mostafa Saleh <smostafa@google.com> wrote:
>> This patch series adds stage-2 translation support for SMMUv3. It is
>> controlled by a new system property “arm-smmuv3.stage”.
>> - When set to “1”: Stage-1 only would be advertised and supported (default
>> behaviour)
>> - When set to “2”: Stage-2 only would be advertised and supported.
>> - Value “all” is reserved for nesting support. However it is not
>> implemented in this patch series (more about this in the end)
>>
>> Features implemented in stage-2 are mostly synonymous with stage-1
>> - VMID16.
>> - Only AArch64 translation tables are supported.
>> - Only little endian translation table supported.
>> - Stall is not supported.
>> - HTTU is not supported, SW is expected to maintain the Access flag.
> Eric: are you planning to review this v3? I think only
> patches 2, 4, 5, 8, 10 still need review.

yes I will do it beg of next week and will also test it against non
regression on S1 only.

Thanks

Eric
>
> Mostafa: is there anything in particular here that means this
> patchset should stay an RFC and isn't ready to go into the tree?
>
> thanks
> -- PMM
>

