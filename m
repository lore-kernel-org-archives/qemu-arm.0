Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3135843ejb;
        Tue, 21 Feb 2023 02:52:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8YENHSF4FuONAqavGSFX7CzzCnxsU+so5kM0WFwOdCo83PZrMXqDpJQ2qUOtztVTFtjSiS
X-Received: by 2002:ac8:5cca:0:b0:3b9:bd05:bde1 with SMTP id s10-20020ac85cca000000b003b9bd05bde1mr19654805qta.8.1676976762264;
        Tue, 21 Feb 2023 02:52:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676976762; cv=none;
        d=google.com; s=arc-20160816;
        b=uYcCi9z/0Ti7WcsNeS/WlvpeybxJ5b5yFDRrfInm+MIP4dVciR5rJnQzMt7WPKia1S
         ohKnVJzXfC+fd6ZCaPgnlK03hWxl1QMb/utINMeJa9qTrXbdq9yr0jdP14uzYWnOf+r9
         46TzANzgYF5y5Ph6aPJZMsa6Wpd63ZmsAtZajNlPGiBOanKATZ4xTOYlh1I1Cj6PSaiS
         QCX4MqXwvQpPXjkwoiMwVtN8wrdtmsy+U67babd6CQGsJPWezfjiqxUQAwfbBF9Lq50B
         H9Kn+ALTaEonO8HhGYMx01mV8MgUJmPrPBzldp6grLqcF1t+z8fCQsnPOLyHeqiEtYAx
         KRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GApRhNe41h6tirvJspLZmtGBzWgKmH2tTukSXCVjVvc=;
        b=oX0EAKF5RrfpkkevfdqSi2FfgOKLfsxp12AYY624ZlYMUQuFh4GJpj6qtVxjw91klc
         CMC279+AYZHcDGkWoWtl/mnYaS/LTkiGfOVf+iRosS25wMmf99F0FypI50xYDxtGnRLm
         zBc+dZsbcc9acLUVsCgAF8zZ0XRfoQOZ7VQlypZrtiZ1Nrhzzscy5gQULs1BtKMlOhCn
         WXAW48P9484CVBWgnjq+ZnqGEnvYYYcSZcZO0vtGtLhMvAoO7PjBSbDnxzmc57Yhhobe
         doQhmds2Q40C74vUAmI4tLHpuH/3xGFdHdzPXBeLUHdOFTfbjHFbHRZM0az70HGZ/MGo
         LhKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ggv9Kh+z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7-20020a378707000000b007279403ee09si168252qkd.168.2023.02.21.02.52.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 02:52:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ggv9Kh+z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUQGH-0005OY-B3; Tue, 21 Feb 2023 05:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUQG1-0005Lm-S8
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 05:52:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUQFx-00034Y-UQ
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 05:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676976741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GApRhNe41h6tirvJspLZmtGBzWgKmH2tTukSXCVjVvc=;
 b=Ggv9Kh+zfPR1di0rI8baQMAjcAanVfet79JGOVs/PL+Om7NymLFU6qA/9Mqp5gcsYzn2ok
 KkwzOoCO/4S8L+c4BeuMiRauIw68pE8unjIoOnr0eF5YsMmys+OvUq1Z4Fd1RV6Di9jG4o
 sYO21yNUTSiJKLYFA1C710vGb7E04qM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-O7Ec-pehOCaK_626B4icUg-1; Tue, 21 Feb 2023 05:52:18 -0500
X-MC-Unique: O7Ec-pehOCaK_626B4icUg-1
Received: by mail-ed1-f69.google.com with SMTP id
 dm14-20020a05640222ce00b0046790cd9082so5841892edb.21
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 02:52:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GApRhNe41h6tirvJspLZmtGBzWgKmH2tTukSXCVjVvc=;
 b=l8/ii+FWK/z4b8S5Z6IhzGgY/U425c92NOlretEkWI6z6jrwIm5p7AtWDkEbRmFQMR
 hKbYqsu/j8Bbh1WbCaX6QCXIjPL7wUUNiAgs4HnPcgn1Xa1UapJq1iqa2zwS19NPLm2j
 s4KHea4nYMtDXypyL1Ch2nz8DOc59Y8nsBiqqPDkBmbDatmmNuhJfWvh4qX4WEb9wdWb
 RdrZmJzyTPWBisEP7F5Ie36AyyxD0nC5LyMgPIYdF/6yne1BMjr6rme3UkQuNXxxykn6
 gxCW/HswR1lz2cLDk0DerUj4YlTInxX0ID5SZBrMAsYjB+9wMSiMi7LhlSnYNKOGZuhl
 6PMg==
X-Gm-Message-State: AO0yUKUM4DrV+jHtDzhNur0MHH5Sz2dYSl5ZEoxkGRtWEGXE921gsgxH
 9SYNpDKf/fM0mGgVerLVyJiGooLRRxb54mvm/gp740cXxDSE6QV0wm3zityAiQNYp9Ck8UpwPPd
 p9wct5qNQdGjI
X-Received: by 2002:a17:906:2358:b0:88d:d700:fe15 with SMTP id
 m24-20020a170906235800b0088dd700fe15mr10880768eja.0.1676976737090; 
 Tue, 21 Feb 2023 02:52:17 -0800 (PST)
X-Received: by 2002:a17:906:2358:b0:88d:d700:fe15 with SMTP id
 m24-20020a170906235800b0088dd700fe15mr10880747eja.0.1676976736735; 
 Tue, 21 Feb 2023 02:52:16 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 m11-20020a50930b000000b004a27046b7a7sm3162687eda.73.2023.02.21.02.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:52:16 -0800 (PST)
Message-ID: <a06461a1-e7fe-69c1-5742-5e1f7bba379c@redhat.com>
Date: Tue, 21 Feb 2023 11:52:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/4] win32: stop mixing SOCKET and file descriptor space
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
 <20230212204942.1905959-4-marcandre.lureau@redhat.com>
 <87r0ukbjfp.fsf@pond.sub.org>
 <CAMxuvaxiN1jYr70k2yK0CUSjo4UQF8DqjPX_COvCdtAWhf3zNw@mail.gmail.com>
 <55e488cf-0b5f-f1e9-0a15-5d3e8c155abe@redhat.com>
 <CAMxuvayAMEwR29fCs3SkHd8iOiOB+36QZBvEd7qG-sMhPdf2EQ@mail.gmail.com>
 <CAJ+F1CKJidDs41TV-NuvnVftXJsLkg7WHRuR2_4Xusde3sPfAA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJ+F1CKJidDs41TV-NuvnVftXJsLkg7WHRuR2_4Xusde3sPfAA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9KhjYn6J2jCO

On 2/21/23 11:40, Marc-André Lureau wrote:
>> Yes it likely can, the first SOCKET value starts at 92 in a simple
>> test. It looks like it may depend on the system number of opened
>> sockets.
>> 
>> I think the second big issue is that we have many places where we
>> assume a fd is a fd, and we simply call close() (which would result
>> in CloseHandle, but missing closesocket).
>> 
>> sigh, if the CRT would allow us to steal the handle back..
>> 
> I found an interesting option here, using HANDLE_FLAG_PROTECT_FROM_CLOSE: 
> https://github.com/ksmurph1/VulkanConfigurator/blob/986992a8b963a6b271785a77d5efd349b6e6ea4f/src/folly/src/net/detail/SocketFileDescriptorMap.cpp#L36
Wow, that's the ugliest thing ever but it seems to be made for this. :)

Paolo

