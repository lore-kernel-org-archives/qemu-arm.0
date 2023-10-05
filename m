Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp356808ejc;
        Thu, 5 Oct 2023 07:33:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnEdTkZUVGufMWkB+M2W/d+VWhNnNUTXmAst5m9THh6rChGMAxo5YKZJf/x+RUTZJDs6tV
X-Received: by 2002:a05:6214:3bc4:b0:65c:fd5b:d74e with SMTP id ng4-20020a0562143bc400b0065cfd5bd74emr5304992qvb.26.1696516386985;
        Thu, 05 Oct 2023 07:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696516386; cv=none;
        d=google.com; s=arc-20160816;
        b=lLUU0ooSXsfbKuVUGD3PUvLiZmhOCKIpNPRE++anFeJmqiyXsnzRISaawij7QO8H1D
         ozj674PmHSvJ3qN5ajDX4knW2q/lznLg9AtI5/t6AY3WGpey9sN6ZGwHdz8X6TVhk1zj
         GMucB8a2D5hks0SoEm8tGA/lRFMoO9uZ+MGemz3pkrpbDmTQoTnbz86/5lZvKYw4l2+w
         KSG4g+lvKzufdJsRd3vZXbm3jVTYi4gFNJK2iOgU7X7GXm+zSYRgT3ZKKdj7ObTLrC0K
         OKgiH10sIz0XDiqnywvxS8yg20o2w9fxH5uAdrDad/reZrpvOsFVc9DMDKrnxO9vvAAX
         0guQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=By4HQqu0HduQ7XjjwLx5typ/4r8lacldykqjQcqGRTc=;
        fh=pv3dPiDD4A/MNDhgsRG4z0eeQruzkzHFplOOqWvSm44=;
        b=yqH/jVR3yy78kcdmwH35qPzHHfDTU+pIqvRkCKY7udOhU/XHQYA3vXzx7pP73vtByg
         t3Wo3WObsF61H8/nw1dcQfXzZ3Ly1M468GgeThyKLvDFkc3v5nmN5QPbhw06VwLfiwJP
         z+1Knf/syMfdapdNArE7NmfT9eeXFWGA8EikNSlPKoXaJT804mS5/TSG0DpT9XjR1A6E
         xcdc43n0DXzDVcf1HZ/HIXDms1ki0DqfiXwjybsSXbx8FK3/GBEd3/SqC0UTp1Bar7JJ
         03T3VwkD7moaDWm96edbLRwL+9udzXZFS3HJ6fpBXsmMJY1S8wmfSTRNLtIDRKxBL3pe
         W1ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X6SloRVD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u19-20020a0cdd13000000b0064f36526d82si925292qvk.21.2023.10.05.07.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Oct 2023 07:33:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X6SloRVD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qoPOt-0005xq-Qb; Thu, 05 Oct 2023 10:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qoPOp-0005x8-0j
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 10:32:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qoPOm-0005dR-VQ
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 10:32:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696516338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=By4HQqu0HduQ7XjjwLx5typ/4r8lacldykqjQcqGRTc=;
 b=X6SloRVDEeEst7OxPmVdjYX9++9+14bM9b4RzZh+gfWQFuUwY0GQrx/RniS5QNNNw+/Xpl
 YkclSa83Yx7leGhauAoGqmuuugSYM7M1C5+ZKvn29i5hNCJVArD7Lyi59yjnQrIvjkH6wk
 J3jz9z4i+Zvl0QUbTjMwdSyXAO02lYo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-zrX9pIRaOI6dEPcXADpHZQ-1; Thu, 05 Oct 2023 10:31:54 -0400
X-MC-Unique: zrX9pIRaOI6dEPcXADpHZQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9ae70250ef5so248013666b.0
 for <qemu-arm@nongnu.org>; Thu, 05 Oct 2023 07:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696516312; x=1697121112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=By4HQqu0HduQ7XjjwLx5typ/4r8lacldykqjQcqGRTc=;
 b=OK4EkT8fdQQR1q28jlx+rtFkIaAoROBwCUyOjmCciohgFpljXf7UduJJg+0IMo3D1H
 OCEoT0Z3fTYhr85Ha4hLj9fdV23jZDzMwVMVtwY6AhFRsiB3iGOiOBMpSv5tUbqvlOSo
 8A9VcXUwbvzfDl8SO29KRR2QjfMd2FkB/dhvncmXR12ZbLj5CKU8odijLlJUOhRN7QFq
 kh9s+Pfb1zIpYlSnahvl7kghuCK1gso5X/KXl26Sou6RhDEmtiCOGdZHdBeT07NnVlWt
 jSuTeKYwglRvlyiLyjjTm5hQrCnvwRATDE/I85fzL4OEnEnku6ra1BDzt+tni9ls7fsV
 qlWw==
X-Gm-Message-State: AOJu0YwLNmBzckQqj4w8w57thPqKZLIBFGyRCTP3zrK4WpO6DwVw0lsQ
 QiLYJl1AZl8gC1sExlid9molxz20B9guIQippItLeBjXvMvEdc2wKg4S6yHGCK6ep+pYpY9Q27s
 HngYv9VWYZsdW
X-Received: by 2002:a17:906:fd84:b0:9ad:e3fd:d46c with SMTP id
 xa4-20020a170906fd8400b009ade3fdd46cmr1345923ejb.10.1696516312428; 
 Thu, 05 Oct 2023 07:31:52 -0700 (PDT)
X-Received: by 2002:a17:906:fd84:b0:9ad:e3fd:d46c with SMTP id
 xa4-20020a170906fd8400b009ade3fdd46cmr1345900ejb.10.1696516311987; 
 Thu, 05 Oct 2023 07:31:51 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-27.web.vodafone.de.
 [109.43.176.27]) by smtp.gmail.com with ESMTPSA id
 t8-20020a17090616c800b009a1be9c29d7sm1291106ejd.179.2023.10.05.07.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 07:31:51 -0700 (PDT)
Message-ID: <454b4732-d9ce-3cc5-e018-8fe2f88cc406@redhat.com>
Date: Thu, 5 Oct 2023 16:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add some unowned files to the SBSA-REF
 section
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230929141918.397096-1-thuth@redhat.com>
 <ZRb3aTLxBSnVGGr2@qc-i7.hemma.eciton.net>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZRb3aTLxBSnVGGr2@qc-i7.hemma.eciton.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.219, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mJCVxiBY3MHX

On 29/09/2023 18.12, Leif Lindholm wrote:
> On Fri, Sep 29, 2023 at 16:19:18 +0200, Thomas Huth wrote:
>> These files belong to the sbsa-ref machine and thus should
>> be listed here.
> 
> First of all, thanks for this.
> 
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   MAINTAINERS | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 874234cb7b..fc415d3cea 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -954,6 +954,9 @@ R: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>>   L: qemu-arm@nongnu.org
>>   S: Maintained
>>   F: hw/arm/sbsa-ref.c
>> +F: hw/misc/sbsa_ec.c
> 
> Yes, pure oversight, sorry about that.
> 
>> +F: hw/watchdog/sbsa_gwdt.c
>> +F: include/hw/watchdog/sbsa_gwdt.h
> 
> I just want to clarify that this is not "the watchdog for the SBSA
> platform", but "the watchdog defined by Arm's SBSA specification"
> (and belatedly the BSA specification)" - the specification that
> sbsa-ref (intends to) provide a compliant platform implementation for.

Thanks for the clarification!

> Another such component is the "generic UART", but since that is a
> subset of pl011 there is no real value in providing a dedicated model
> of it.
> 
> Which I guess is a long-winded way of saying: this component does not
> necessarily want/need the same maintainers as the sbsa-ref platform.
> I'm still happy to maintain it, and it may make sense to keep it under
> this header for now.

I think as long as the sbsa-ref machine is the only one in our git tree that 
uses this device, it's fine if we add the sbsa watchdog to this section 
here. If there will ever be another machine that uses this device, we can 
still reconsider and create a dedicated section for it in the MAINTAINERS 
file if necessary.

> (In which case
> Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>
> )

  Thanks!
   Thomas


