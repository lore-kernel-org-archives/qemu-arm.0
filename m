Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4679582njc;
        Tue, 27 May 2025 02:06:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBt593kZvfhSIzfze69+zGaz2ViQDab06gzlRRk5V+Zrc5IB2K7l17qh9QezmBwfhp+M/6pkuBI/Gk4g==@linaro.org
X-Google-Smtp-Source: AGHT+IFik9NYrgYof+Bw5+arbOBdLGUEBivH6DGK3xNDycExjX4p22pjkvP6l3HPjp//OH2TsCKU
X-Received: by 2002:ad4:5eca:0:b0:6fa:a672:951d with SMTP id 6a1803df08f44-6faa6729a52mr134504406d6.23.1748336761129;
        Tue, 27 May 2025 02:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748336761; cv=none;
        d=google.com; s=arc-20240605;
        b=jXESn8p7P24m8yC9gnEc5DMaxrUhK+JxZ3NCymE0Lzk2HlA13zeSHdALYjcbCWyAB6
         49RTjBAyxPsCXOvMMsNwvhWPXx6F/ftvN1TLyGKJImVYEpaxgI87IgWUo9h9q3pUYUUk
         A61d9RJZ13STzbWZZTPUvg1WUWGpg2StfKEuEYcH9jGnyA1byWJSn3YTVns4HTpSV0KO
         0XsQsI14qlub62b61rETbMKd5c1H27Lc4HzHV1FxUKaKvASGf9poEPOf9Xm437b9TPsm
         +KG92OM0FtzaSddhY9g+KnxEHqppq0WC7OlhKT2Uq9AK3v6gJhzVNG46o1Ho/ta3u6NU
         qfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=avtNuWizimssGLsvXQTc/zqNpEmAnzHUinX40RmTmSU=;
        fh=x24OgjmIRm11PZwaVW5XsAkaw6MdGp4kTqkA4efWaq4=;
        b=bPTjraBNUfZIR5y6BywgAVTy3lLzdE7/DWAEzXqkrQXEcLGqFjYQSyGIueThqGN0Sn
         xZMzsF8gsuVK8fKTPx0aJRTUin0HIkTnZCmkKShiTACsCeeMjngxuUxlvs8tYcHI+vTM
         pn7jaApMf1NVdgUE01eScOZMyriMcNXxO3Y9tZkjnwBCHE/hppU5Fk2pBTrSuAIYJh4N
         UhHlSGeOZ4DplaS+URo2/twMdIcrkCfXTQlnU+G5ZS6gKkz+o+bE1v0bBem69urZQvKT
         0rzbpEUoJIQ/8AuYKrFPQZzJVwUzD13GMPpfn1AjJNhrnnVuWuuXcBWFvtJ+Rv6gGizB
         CkWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TjCnNh/y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6faa9e799desi44439116d6.377.2025.05.27.02.06.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 May 2025 02:06:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TjCnNh/y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJqFq-0003Mm-59; Tue, 27 May 2025 05:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJqFO-0003J9-JA
 for qemu-arm@nongnu.org; Tue, 27 May 2025 05:05:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJqFH-0003eE-MK
 for qemu-arm@nongnu.org; Tue, 27 May 2025 05:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748336713;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=avtNuWizimssGLsvXQTc/zqNpEmAnzHUinX40RmTmSU=;
 b=TjCnNh/y8bDf4Mlz1BK1ZBtIMc3bnt/EhmPuPMSPObCbI5yt2z9V9MZ01aaWTs/5EqTAGv
 nfQCjhnUHHuxBJUI44oJGMclSptb5RusEF64VuLekGC/Pkr7g4RC0vSRkqeOJrMr4iRwcm
 gfe9XQF+0uulWxfzim3Lzf6iauJlJLA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-Xw6O3h6FOLa54r4X8F_m7w-1; Tue, 27 May 2025 05:05:11 -0400
X-MC-Unique: Xw6O3h6FOLa54r4X8F_m7w-1
X-Mimecast-MFC-AGG-ID: Xw6O3h6FOLa54r4X8F_m7w_1748336710
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4d6453521so1044354f8f.1
 for <qemu-arm@nongnu.org>; Tue, 27 May 2025 02:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748336709; x=1748941509;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=avtNuWizimssGLsvXQTc/zqNpEmAnzHUinX40RmTmSU=;
 b=YhGSVG6B/yH3BHBgbCgq1Mq5z3m4KJmW3PyF/7gCISY9GpqTIMPvIia/uapS/WNmJ9
 p+jXyuoeuPpJ7PUxHgZmYerHZYn8SZ57QuKw6jJwMkIdph6m9VPj3LnczseH374mFC9A
 QuqqvvnZ1ZYXww+K8//BOAOYrElMXZN6H2RYCISCkMwUQnYYTV5onhXTcikwoyMKtTR7
 JCxX2+pvUeMJ01xb77bsqRn08MmU8YM0eCa9tfDhbPKv4zu0dAfqs8oZnFxFnpiXmdBO
 5i6rDQSds0ZZIY1Dnd9/zqZTBRkgv1nTyyxCTYoBbW6uOKkMmtX6l14QoEAM5jwqIFKz
 4ixQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYNPufXsOF4deNjG6Efy5mkVbKsGuxDCMUjcXs4uPard35NUzmsUMcW8o/Pqcty7CBUvdKU/bApQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxl2uNhL2KWCHBBTVS0WzhJMh+wHfL2iT0BuYS2BShGmVWOQB7B
 cu/Q7yKKG7U+Ga32UQzf2v5RDTmEm7Rm3vE/rWzSVB7LR8LSx28/QqghVCW2k0UMlQQwz2XFo48
 NhW9jau2vbUY+YNM8cL+cH2dbl5pyoEL7qNhhuIYbG7r7xQscW8mcJTDYONCtXQ==
X-Gm-Gg: ASbGncu1xRxPv4ua5WcxhewCe1gTUOJo/q9vsnV2FUxZ8ZOVgelOMOHeToR1H06oAIW
 5dfec4y+3v1JOqcR5TpHaCGkS/DzA8UvAQE1PRkDeu+016aNw+NEszUKv+jBo7du4GtJ7d4SgTN
 FykVklHfvNemdpAPJPjd7SRrR2d599JOgk0Jj6nXtJNUxHKPCwcctotHlQj5axplru3TXQn5l4Z
 mVOz2b4yEQ/zZ2QwIFWzELeC4PgwKkAuUUCAjJRrNHtv/62m/G/9GpmKTSo7SbZeqJQ+/xXVy5K
 cfbW7yRfP//s1kPaewk39MVuR6GIgTK/VUDHBz3qVl2kHXbjr7AuorCzBH4=
X-Received: by 2002:a05:6000:178b:b0:3a4:dfaa:df8f with SMTP id
 ffacd0b85a97d-3a4dfaae1e8mr2437503f8f.16.1748336709290; 
 Tue, 27 May 2025 02:05:09 -0700 (PDT)
X-Received: by 2002:a05:6000:178b:b0:3a4:dfaa:df8f with SMTP id
 ffacd0b85a97d-3a4dfaae1e8mr2437465f8f.16.1748336708921; 
 Tue, 27 May 2025 02:05:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4d74843b2sm6217927f8f.53.2025.05.27.02.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 02:05:07 -0700 (PDT)
Message-ID: <e3863726-6662-417e-ab7d-005c5ff9af69@redhat.com>
Date: Tue, 27 May 2025 11:05:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] ARM Nested Virt Support
To: Marc Zyngier <maz@kernel.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, gkulkarni@amperecomputing.com,
 gankulkarni@os.amperecomputing.com
References: <20250527062534.1186004-1-eric.auger@redhat.com>
 <86msayec3a.wl-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <86msayec3a.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: anV8dgy9sjwm_ehxCH6q_mZvK18hRsBiaZiq75qSsXQ_1748336710
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: L9WdMdUsYqD6

Hi Marc,

On 5/27/25 9:39 AM, Marc Zyngier wrote:
> Hi Eric,
>
> On Tue, 27 May 2025 07:24:32 +0100,
> Eric Auger <eric.auger@redhat.com> wrote:
>> Now that ARM nested virt has landed in kvm/next, let's turn the series
>> into a PATCH series. The linux header update was made against kvm/next.
>>
>> For gaining virt functionality in KVM accelerated L1, The host needs to
>> be booted with "kvm-arm.mode=nested" option and qemu needs to be invoked
>> with: -machine virt,virtualization=on.
> Thanks for respinning this series.
>
> Do you have any plan to support the non-VHE version of the NV support
> (as advertised by KVM_CAP_ARM_EL2_E2H0)? It would allow running lesser
> hypervisors (such as *cough* Xen *cough*), which completely rely on
> HCR_EL2.E2H being 0?

yes I can definitively extend the series to support
KVM_ARM_VCPU_HAS_EL2_E2H0.

Eric


>
>
> Thanks,
>
> 	M.
>

