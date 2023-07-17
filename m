Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp5849717eje;
        Mon, 17 Jul 2023 10:33:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEow3YyFNn+ugY+br4CzdKqiApcEgaWpxd/UEPG47mFyCp5DVLHlnGLgOsIqSXZZwgga4AF
X-Received: by 2002:a05:622a:1a20:b0:403:b0e7:8e22 with SMTP id f32-20020a05622a1a2000b00403b0e78e22mr15142408qtb.59.1689615210230;
        Mon, 17 Jul 2023 10:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689615210; cv=none;
        d=google.com; s=arc-20160816;
        b=gExQe4cj7gleyJUmP8a8aHeUv2ZmyBTJLcNBEX2zjjgkFrEHjRPTxUJLMUfheU/BLx
         g3h/9MoQ/Ki40Am3vFONSVjSq+cVPMQhfVd6Z94P+xKyIyBEXwTENB23Kpr6bX6dMYYq
         AhFuFAIWlg9ZmHpoZziRK2lE56GJj/0J6J+NtMlsiGpnV5XvTjJxaMow2YhHmmXbX1ji
         vpnukLAh4+1tzuT6D4q99DwvRqB0kbrjeLB7OcetGFch1gj0EIJdi9lMzwGpz9mulbXm
         IPSVuFVyCORC70n0mvTAuSLA0AsXEOt1K4JQ/YGlPhw3tDtm7r1R2Jkkm6oIIt3r80Ba
         kjdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Hhn400pb7+NEFIHylSRvV/lRvxCONtORbBhhXurrMgQ=;
        fh=ildo2AcXoZMr4iaZCKEZGNMT+FkkRJLWttTRZV7uDGc=;
        b=TzSC8yobbMxGke8NlPpKzgGpuh7mATuUlZha0PFZwOl26wYPrqFvNIFl+veEoC+Eh6
         xULFB2JVo3yVOZsHpDvQupa3A4SarPl1JUMlc30Y364+2LAqRWR81p9zc7ZoKF026JCD
         AAiNwIgGwxMWe2rokwcpY1GdS9RbihIzfw3G1Ym6GJcuTaddJcMkkTW61VvzEJ5i1tZG
         dGsA7FOjeXx/68BtGmjen4yAFZfFAbt1SgYWgYGWHrWOLF3DdCS7a95AmJE8hOy68csD
         yWW76qtX2GK5ycus6HFB9dUeh2GzgU6i4LqdqUuy591ns2bD/zuQZ/UBvFcue59MD2oE
         nUoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dgKxoy9J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4-20020ac85a84000000b00403d06c84c0si14610qtc.570.2023.07.17.10.33.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jul 2023 10:33:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dgKxoy9J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLS5b-0004m1-FE; Mon, 17 Jul 2023 13:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qLS5Y-0004kH-UN
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 13:32:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qLS5X-0000VU-IS
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 13:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689615166;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hhn400pb7+NEFIHylSRvV/lRvxCONtORbBhhXurrMgQ=;
 b=dgKxoy9JhXldBTuf3fyScB8RtD1MfnOaPeRD6bpiKvBfxEH8s+EKsvvBPXnEm7Z39YFPBz
 vgg7plkuv+SpuqCfpRZTGjjHyqWMXsFoTov1HCnI2f4ZD5wgsxO5CzzAiqXq2ga1xTQRHh
 1AI7wINrtjtgJIxCFct2B5PlM9WqUwo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-qL-PAzs7Ms6xYyoXv-98jA-1; Mon, 17 Jul 2023 13:32:43 -0400
X-MC-Unique: qL-PAzs7Ms6xYyoXv-98jA-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5eee6742285so49468056d6.2
 for <qemu-arm@nongnu.org>; Mon, 17 Jul 2023 10:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689615163; x=1690219963;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hhn400pb7+NEFIHylSRvV/lRvxCONtORbBhhXurrMgQ=;
 b=PiV3v+hDGQx6xT383QUbK+Y+RiHufBwxmDB01krw58/nY4NdlHl8hHG1EsNMHE3nsd
 EXF+5FHM5h+ypSV28f5IDDVR00mVp8HAN4gAszm4gB41lVJwgQkTD5lQBATwqFHRCFH1
 kn+83vvW3Hrp8XNskT5YEzoVe0KT8/WPHVfHDGhzAUhybiDjEMEgnRXYSIF/NuUurko9
 5lB8wqtxQy1MrqwXcSqPGQi95ahPD32HjgMkWWu2mwLNtIdNMjKkf1ZiuwwCcdcEv+BC
 SpF99u5BjN/6iebxn5SfKRseHNYUwwX6B4Xmcux2BjzRBMKFQSBoQnUPrsrjeTMzFVfT
 m4QQ==
X-Gm-Message-State: ABy/qLYYpivY/8ecnBksGuIK83Pw3a0SzdjDeuZkhUJ+FHZbzua8aUyB
 07hjrHOqxS261r03ujYKNIYFJGLlpJAdHF9xjf4KETVweclff1RzU7jbJgMaQBbGymG31dqwhqc
 o3bA6F51qvu+H
X-Received: by 2002:a0c:ab46:0:b0:632:32ce:7947 with SMTP id
 i6-20020a0cab46000000b0063232ce7947mr10283765qvb.28.1689615163459; 
 Mon, 17 Jul 2023 10:32:43 -0700 (PDT)
X-Received: by 2002:a0c:ab46:0:b0:632:32ce:7947 with SMTP id
 i6-20020a0cab46000000b0063232ce7947mr10283747qvb.28.1689615163182; 
 Mon, 17 Jul 2023 10:32:43 -0700 (PDT)
Received: from [192.168.43.95] ([37.168.249.127])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a05620a14a200b00765a7843382sm6207434qkj.74.2023.07.17.10.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 10:32:42 -0700 (PDT)
Message-ID: <8a706e88-ef7c-b914-bd1a-3272f9bee010@redhat.com>
Date: Mon, 17 Jul 2023 19:32:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.1 v2] hw/virtio-iommu: Fix potential OOB access in
 virtio_iommu_handle_command()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, jean-philippe@linaro.org
Cc: qemu-stable@nongnu.org, mcascell@redhat.com, taoym@zju.edu.cn
References: <20230717162126.11693-1-eric.auger@redhat.com>
 <d28e1e4c-0c7c-e527-4f35-46ace2daa734@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <d28e1e4c-0c7c-e527-4f35-46ace2daa734@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 0xm4ZoiDnUGE

Hi Philippe,

On 7/17/23 19:26, Philippe Mathieu-Daudé wrote:
> On 17/7/23 18:21, Eric Auger wrote:
>> In the virtio_iommu_handle_command() when a PROBE request is handled,
>> output_size takes a value greater than the tail size and on a subsequent
>> iteration we can get a stack out-of-band access. Initialize the
>> output_size on each iteration.
>
> A backtrace would be helpful (or reproducer).
Well the way to hit it in explained above. PROBE request followed by a
different request consumed within the same virtio_iommu_handle_command()
call
>
>> The issue was found with ASAN. Credits to:
>> Yiming Tao(Zhejiang University)
>> Gaoning Pan(Zhejiang University)
>>
>> Fixes: 1733eebb9e7 ("virtio-iommu: Implement RESV_MEM probe request")
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reported-by: Mauro Matteo Cascella <mcascell@redhat.com>
>
> Did you mean:
>
> Reported-by: Yiming Tao <taoym@zju.edu.cn>
>
> ?
If I understand correctly trhe actual people who found the issue using
the tool were those I mentionned in the credits section in the commit
msg. but unfortunately I don't have their full address. Mauro Matteo
forwarded me the report which transited though Yiming Tao. Anyway I will
be glad to put more precise in the R-b tags if I get some additional info.

Thanks

Eric
>
>> Cc: qemu-stable@nongnu.org
>>
>> ---
>> - added the Cc: qemu-stable@nongnu.org and copied 2 persons involved
>>    in the reporting loop
>> ---
>>   hw/virtio/virtio-iommu.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>

