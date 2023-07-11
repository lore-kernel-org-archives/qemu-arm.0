Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1982917eje;
        Tue, 11 Jul 2023 08:38:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFqX46V5uuruK+2q+h7240w3kfN/HwUqId+wP+nthQdXvg1GX0oK8GLbGm5+88vCaDAQcD5
X-Received: by 2002:a0c:a89a:0:b0:631:f384:2859 with SMTP id x26-20020a0ca89a000000b00631f3842859mr12636015qva.38.1689089913342;
        Tue, 11 Jul 2023 08:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689089913; cv=none;
        d=google.com; s=arc-20160816;
        b=fRI3pix2478gTEbVS1w5V+jJICdpfy7blv9XCmFsMaUy0JzUgv7ycEM9XQhzSnECby
         owBb2h6x7DJRce7Kr9XckrBbrhSW66CjBoRQkDgs79FYpMOO9WJHL3SpWfzxcWISvkKC
         +eueRY5CJ3jYTwItBT3FypgrqkUn3c8AAki+INUCSDz2Zij/zZi6v710MU1jSz5FLThG
         bccEglJn+ZprvEcW8zZ4raRQJCtJDrOT50VZ5ojJ9B/Z7r/SVfuM7x4uWJ3t26IZGOd5
         jFQ7afkAsnIhksAJISKjG3iiIMGKrogpbxvO6SsWMbSmbWT/CHNNueBWc+4qsBUoWVMC
         7DvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=OLvHdrvh5NgLCo+BEJ+it3y42RFQYgoan0DilXLSV50=;
        fh=ISZhyQQp034M2RdAlfkN9fpebr+p+xs3V6UF0eurX1c=;
        b=ECdYh7D/k2wk24xUEVx5avvjy9HoDD/Gx3Scdj6LJgkWQALIombQn5r4gBZ4jFikC5
         Y37BqHOZX2B4zMchzukBO8kQtvtuACRVZRRY9W/6U1JI8SAh9jG0qIokoVq/8M4cHlOV
         IAZyXtLKXQNgTSiL6ABjzonKljBxyj0Hfd4wahwRx6e+F9dsbxGNMGM6rTFMIGEK+cAi
         HSc2DiXH1uvKRe+cHpys2K3tuVilLUt/EuldIL0vtbIeO+6cAi/S23d92WIKqmQ9dEWu
         LpPgYrHxcrS5nhOFph9BDT9WkNzRs9GqFjVBOQtn710tbdqSQ/58Bj5QYpkd6YyJjtyb
         YdPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MqHfjsvQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22-20020a05620a28d600b00767d49d0ff4si917783qkp.196.2023.07.11.08.38.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jul 2023 08:38:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MqHfjsvQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJFRg-0005Id-HQ; Tue, 11 Jul 2023 11:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qJFRV-0005Bm-LA
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 11:38:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qJFRT-0006jw-Lp
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 11:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689089899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLvHdrvh5NgLCo+BEJ+it3y42RFQYgoan0DilXLSV50=;
 b=MqHfjsvQzNg5y09ygr4IcPqf9/JeGMQ+sf8N5zrchjlF7L3qpnmrdBmZ875IxMrjCKtu93
 amEdGNVkiqrjpL8OkzlPNsy9MmvuYyeQnrwrWT5FbJFWktmegnEptvzpI6EL89TDcF7ZbE
 1qj4ml8QRtxU26RkC7o6dX+YuKeg/y4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-Xtf6_EZeM3y5Z2RT7Pl8tA-1; Tue, 11 Jul 2023 11:38:15 -0400
X-MC-Unique: Xtf6_EZeM3y5Z2RT7Pl8tA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fbefe1b402so36619035e9.1
 for <qemu-arm@nongnu.org>; Tue, 11 Jul 2023 08:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689089894; x=1691681894;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OLvHdrvh5NgLCo+BEJ+it3y42RFQYgoan0DilXLSV50=;
 b=hy+MQsi9RmDCJuYmXzuCDX1NYs1PPZSst+YNvtFN2NrY18UEaRx0JtbJRws1DXLiUV
 UvccWwCgcYmLTpPyI9mIf/aBZQ66ESLxQHsR8nl9Oa2rleY5pwWrhPeI/xcmjbaJASWR
 HKe5eOLMlsro5enbSg/9ALxDOm9vBUAVn/GhKP8Bg88gAZGrgbeqhnTnpxiaqbf4tsJq
 JFo7SFnX2KhxZJm745zrtFy00XtqPjuPq/r8P34+s4BBtez/KMpw5JeMyHwooXly/XPU
 sLtyS8ZV0qP5h97e7xjUA+tR3RwMldFNaMD9WFXbwb6rd55B/tlD9Tz61oPfHOlpLZxB
 fwHQ==
X-Gm-Message-State: ABy/qLads+MSOxZCMb6HO92oNN6PXWozoeqWIG/edNETa8T/MG7qcOgV
 7wUFq06cVQSrot3l2FlDEh4l3paUuWBO4k3BULd//NHnhK2spo1pUn79WEXRaQ7SN1cD2k0dfnF
 oBxLoFPgPm4Eg
X-Received: by 2002:a7b:cd96:0:b0:3fc:443:3773 with SMTP id
 y22-20020a7bcd96000000b003fc04433773mr9863627wmj.30.1689089894680; 
 Tue, 11 Jul 2023 08:38:14 -0700 (PDT)
X-Received: by 2002:a7b:cd96:0:b0:3fc:443:3773 with SMTP id
 y22-20020a7bcd96000000b003fc04433773mr9863605wmj.30.1689089894380; 
 Tue, 11 Jul 2023 08:38:14 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:4000:13ad:ed64:37e6:115d?
 (p200300cbc745400013aded6437e6115d.dip0.t-ipconnect.de.
 [2003:cb:c745:4000:13ad:ed64:37e6:115d])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c294200b003fbe791a0e8sm2910555wmd.0.2023.07.11.08.38.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 08:38:13 -0700 (PDT)
Message-ID: <78c1cd8a-eabe-698d-69b1-d9df4d5f5c4b@redhat.com>
Date: Tue, 11 Jul 2023 17:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 0/7] virtio-mem: Device unplug support
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>, Mario Casquero <mcasquer@redhat.com>
References: <20230711153445.514112-1-david@redhat.com>
 <20230711113716-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230711113716-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: pObM9hMqYfkc

On 11.07.23 17:37, Michael S. Tsirkin wrote:
> On Tue, Jul 11, 2023 at 05:34:38PM +0200, David Hildenbrand wrote:
>> One limitation of virtio-mem is that we cannot currently unplug virtio-mem
>> devices that have all memory unplugged from the VM.
>>
>> Let's properly handle forced unplug (as can be triggered by the VM) and
>> add support for ordinary unplug (requests) of virtio-mem devices that are
>> in a compatible state (no legacy mode, no plugged memory, no plug request).
>>
>> Briefly tested on both, x86_64 and aarch64.
> 
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> 
> feel free to merge.

Will queue tomorrow (and send a PR soonish) if there is no more 
feedback, thanks!

-- 
Cheers,

David / dhildenb

