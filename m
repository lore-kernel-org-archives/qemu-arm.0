Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1563998lfb;
        Fri, 27 Aug 2021 06:06:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZxKPRH9LeBLCRfp7gWQkWAVhqY0HuNiSVSgRO2JIqCjL3MEHnE0dTQQ7bBVDKrFEuSN/g
X-Received: by 2002:adf:c3cc:: with SMTP id d12mr8351587wrg.312.1630069571370;
        Fri, 27 Aug 2021 06:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630069571; cv=none;
        d=google.com; s=arc-20160816;
        b=XB9bg/BoMNwZPVfjc730o61qc9Kdyle4ZrVEmvxZq4Rgxam+x5yCnoMzyB7A2yTfMf
         grkiKibBS2tg/PnoW60nb9E2h8bmzhoeF5ICCN1LkBM6YO6qqlGGppy6E5g8s4bxbVIz
         zvg2dr5hv4zMunr1jNHrFBdrSKimxcg7+a7Sj5qWqUERgkRcTgnD7oZS1FR6cEktnY+c
         0+v2N693tcNxnS5n0QHoN1UtgOuq46ghklJjtfZP+I7ZlbguZFkEDvRf9TKo9k0/6q9H
         y5RjjqPhSMEOOSrvCnw5QWznGbgTybxym+hreQMdq382aUBV3XrKLg5M0uTSsAIC0dyI
         yz8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Vj+YOxHrzDqrNWskNgEUOJzuOh7+9MXXC7aNBbxamE4=;
        b=siV9fCsO1hpIULuri9oA8fCwo9aySuC4V+VocS/YEfhyVZr+++yySOqaHjwTmpyf4Z
         JS6R7+12mHY3u3Sc4GIJEFGV8ZWosmdAzEK4KHz9AQ3iupFXln8Q9sX2PKCNrlltaGlv
         gSHVoaxJcM9vrJ6JVotHw3U6bd21/+eOJI3Wa08/m+wG3OS7aMie7mbUmufrlqO5L0UY
         soAqMXORB2F28PHyFE+iiTSg8rqZX4dEc5VqW5CWXTv/OYsMR7ojQpNccNhRvgMkYy0c
         UGs1hKDBqMvyX/qsfeGGbfxOJ3JYdFx+eyX8DKzdoxV6yZqGFRHnzI8siI2hXJh8/1KD
         jKIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QTpk4p6m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g81si10509690wmg.9.2021.08.27.06.06.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 06:06:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QTpk4p6m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJbYg-0002K9-G1
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 09:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJbY3-0001yx-8P
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 09:05:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJbXv-0008VZ-7J
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 09:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630069521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vj+YOxHrzDqrNWskNgEUOJzuOh7+9MXXC7aNBbxamE4=;
 b=QTpk4p6mEZvlsO52ICyhZwdaXRPp03gjcFly1B4jMQH73I6P3Muh/cM+qx0ERYxw4Fos4p
 WjOOATUDMOp6KNqLCzaUxwbH0nC5VscCHuxWmJ05X3yENkx8iz1gKwfWRGdMOrzA6dbbXt
 A4h+JHmUyHeo7ZZgxe1nfvp1HfjWTEg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-FhvYnWPwMwCQ3-86qCpY6g-1; Fri, 27 Aug 2021 09:05:18 -0400
X-MC-Unique: FhvYnWPwMwCQ3-86qCpY6g-1
Received: by mail-wr1-f71.google.com with SMTP id
 p1-20020adfcc81000000b001576cccf12cso1824295wrj.6
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 06:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vj+YOxHrzDqrNWskNgEUOJzuOh7+9MXXC7aNBbxamE4=;
 b=GWn0lOeKJ3x2ka83hczc8rDQcPHYz0TrN249pItIvRTXjV8hIFPubJwkRPHdf3Y4nX
 R7MCm9kC+7zvR+uBs8tYseASfo8fKxsUebI7hxDOyNfHkmGAKow8cG8HRSH9/0CG+jWO
 Z/bdV88vAKMJOaPeNaoC6xdw5HmPnG/ovsKVomLMrw+HkPiwlHG65OoDklDQuGi2HK5u
 Qjb8TyUr1p6kIVi6+at7GJwAf+QnbbZPWHolRLXr4MAl8j60hMKG9L/nnjYDs1neqS95
 T94mZoNg+2F6cM90rkLFgzn1MDMg0QTqAL/XYQKyqWbWo9i/jj0AThAZKqi4WwcHIvVI
 ogfw==
X-Gm-Message-State: AOAM531/7Q/R2w1ycr97XAa+vp4nxNvW8wcuOW/iKJBPOMmYyJ5jX/sz
 Y/uPexBjNE97suC7vmKS+4asO+cd6fnkG6bMhWsO8NVFXIUurr/FCg4Y65M/SanOk7U5Y/Kj+4x
 ohW98gA27dydP
X-Received: by 2002:adf:c3c9:: with SMTP id d9mr9058976wrg.339.1630069516900; 
 Fri, 27 Aug 2021 06:05:16 -0700 (PDT)
X-Received: by 2002:adf:c3c9:: with SMTP id d9mr9058945wrg.339.1630069516727; 
 Fri, 27 Aug 2021 06:05:16 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id s12sm6416619wru.41.2021.08.27.06.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 06:05:16 -0700 (PDT)
Subject: Re: [PATCH 2/3] meson.build: Don't use internal libfdt if the user
 requested the system libfdt
To: Thomas Huth <thuth@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e19371fe-8aa2-f098-be33-1a8251f97fb2@redhat.com>
Date: Fri, 27 Aug 2021 15:05:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827120901.150276-3-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.437, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X5Py4MZceP8x

On 8/27/21 2:09 PM, Thomas Huth wrote:
> If the users ran configure with --enable-libfdt=system, they likely did
> that on purpose. We should not silently fall back to the internal libfdt
> if the system libfdt is not usable, but report the problem with a proper
> message instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  meson.build | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

