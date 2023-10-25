Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2685470ejb;
        Wed, 25 Oct 2023 05:03:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU8zjmOzf/kwS0x1glpooMdfQGa0zNn8aj8g9OpOkZNert4bTcF4uxIdrnd1HKM0WyKJBo
X-Received: by 2002:a05:600c:444b:b0:408:80bb:ae8d with SMTP id v11-20020a05600c444b00b0040880bbae8dmr8164415wmn.32.1698235381985;
        Wed, 25 Oct 2023 05:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698235381; cv=none;
        d=google.com; s=arc-20160816;
        b=QnsNwlCXFoNTZK963/zc/+oXgw07pws+5LwMthtNvM55O92N7WDUfSXikl3pqOqx0j
         ctQOeA39UKLywUT09RsHtNhVxt3IQaWeESUrvQNB79z+6UHNBin6siz/7gl/vcMxaO/N
         9JHI3scM6cd3j5ZquD9cT0HpjBmlsQ+rZL6zWU+T5aHeSvYJjEMVnBUibUR/EYjO3ay3
         vzSVPoJxM4J9byzgUyEChF6fYWMEZTgY5Owi8duNjC5mLPLtYblQAc3LNez/iWI04PAt
         2FtoT/kXBo44pFHlNvpryvDr82HQhxh2WHAXoSMZmf3oqIgXac5+0webtWBDKJkShJHx
         9ygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=/MtwwgrpkdhHdvEdprEYZoYBdfbvHUCDmrYKwEpkupg=;
        fh=0SwnxTk/kH/eCu4S7mbtHkWoZOqjr8yjdh6t+AwknJ0=;
        b=OxcJL9FHlhGkxp/8xhn5f7HFpKLhBV+Srl/ESbskTdWc49ruii+5a0qpMKQTGkJdcc
         C74487cLW/9GF/dy4Kkup6w4cEbVsKz223eAMNGAbkrKbQb9gHMRlLNfxV+niEEEjYXh
         YwXSrBRfjRhPjy+Xr3ce4aKEYZh2sqO8Zcw7gzsYeBswKZXCY1qy29eBs324x+ndZLn+
         v3vHe+7UCq7whMavjO2a2Kt17f7NMvjhevAfoqXcMeY3PqpNRYnlhRYawmpt597zB9C/
         wX1RXiEayu/6A+5OPF9P4+1W2CNU2cEmsZzMd2ALsXJqlVo6QQck7M3TK10TLxBk2TP0
         RHDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SL+fuag6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay11-20020a05600c1e0b00b003fe590d8185si11153241wmb.27.2023.10.25.05.03.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 05:03:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SL+fuag6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvcau-0004O9-S6; Wed, 25 Oct 2023 08:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvcap-0004MJ-33
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 08:02:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qvcae-0006O7-BY
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 08:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698235343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/MtwwgrpkdhHdvEdprEYZoYBdfbvHUCDmrYKwEpkupg=;
 b=SL+fuag6G6HWcmTMKvcYN+zeh4+5fn4aRHYElaO+crN7X6WYeRAZ3JevQBZE6aC1k7IVTZ
 zQEpVyjo+kbpmE8HJCsIGDHktgFMb5DQ8qJ5ghTt0l3gEMSviA0o28kNdZc965Q6JJmqZw
 xkEq49gMu31HWRINm1iS0NQMJ2mnDps=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-4t7gyphsPfGvsF5bcuwgAw-1; Wed, 25 Oct 2023 08:02:22 -0400
X-MC-Unique: 4t7gyphsPfGvsF5bcuwgAw-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7788ce62d50so690655685a.3
 for <qemu-devel@nongnu.org>; Wed, 25 Oct 2023 05:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698235342; x=1698840142;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/MtwwgrpkdhHdvEdprEYZoYBdfbvHUCDmrYKwEpkupg=;
 b=DXqDHA9I3tZJUBqAut7Fj4OkTGXFvC94PcQ76Biml6ehAIemKYrD/74JwoGd1nWRc1
 og76jC5v8kR1nxDBrYnQw07EDOy8aBrz3VEQjQqwHMXaLw3pJGUtB+8V2EVQv05WKe01
 Uz/lQ22exIxNVzddRaXsycA+1gZpQsbf4t936Ir57AADW5DmXw2tJWZ92id2BhVwhzh0
 sfwLiX1wv0XuRYd9UDNe5v+vxC64bSNN5KBpSbGaMNp5JHykdotjwUp/nViUE9xhEkkH
 g9gM/QJnSxQ2qNNmo3VVWN3duGbZR3awzs6r5cqgD9eQ/o1mlWWID1vx3b40cnU9BPLd
 VceA==
X-Gm-Message-State: AOJu0Yw2p8MPYRKxEmoXLkvzMIoeJpoH2K+zkHlQKssqllfXr42qrMuW
 ZqgATBTQdGSbha3fQJm9NQPI2/aufOhOzrgoSlw1apVr8O/1R2MoHVMtoNr9eefCwRZ84FO2dQW
 bMd77d+cG+QyjgjA=
X-Received: by 2002:ad4:5bca:0:b0:66d:46ac:2fbe with SMTP id
 t10-20020ad45bca000000b0066d46ac2fbemr15850419qvt.16.1698235341931; 
 Wed, 25 Oct 2023 05:02:21 -0700 (PDT)
X-Received: by 2002:ad4:5bca:0:b0:66d:46ac:2fbe with SMTP id
 t10-20020ad45bca000000b0066d46ac2fbemr15850384qvt.16.1698235341622; 
 Wed, 25 Oct 2023 05:02:21 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-238.web.vodafone.de.
 [109.43.176.238]) by smtp.gmail.com with ESMTPSA id
 n18-20020a0cec52000000b0065afd35c762sm4341536qvq.91.2023.10.25.05.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 05:02:21 -0700 (PDT)
Message-ID: <6af3eadf-9c3d-46c1-b9a8-634a1a7d5d9d@redhat.com>
Date: Wed, 25 Oct 2023 14:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/19] arm/kconfig: XLNX_ZYNQMP_ARM depends on PIXMAN
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, qemu-ppc@nongnu.org, Gerd Hoffmann
 <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
 <20231023113047.2572137-17-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231023113047.2572137-17-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: zvk4eH2XmUPZ

On 23/10/2023 13.30, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The Display Port has some strong PIXMAN dependency.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/arm/Kconfig         | 3 ++-
>   hw/display/Kconfig     | 5 +++++
>   hw/display/meson.build | 2 +-
>   3 files changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


