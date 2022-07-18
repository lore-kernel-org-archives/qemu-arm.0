Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1193908lfp;
        Mon, 18 Jul 2022 02:25:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1thCnwPDZJAvCiUgswE/fX/J2BtJlOzREA4HDjI1PWpN2nZleLgBJB3sdotStFrdpHhVWl3
X-Received: by 2002:a05:622a:589:b0:319:ddca:37e4 with SMTP id c9-20020a05622a058900b00319ddca37e4mr19938646qtb.36.1658136349421;
        Mon, 18 Jul 2022 02:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658136349; cv=none;
        d=google.com; s=arc-20160816;
        b=YF/kj+Vgu0M5SvOuicuKxcAAfhidP/wBAex1hbt5JFm5hQgD29SXHJPKUlBNFPjb9m
         Gq6ei9IKuyqLiQDxATQlhqVV9m9+qdA8Bz4J/Quv+SmZVTpEW+DFM3EjrrHC0GESZzI4
         DNTAYQeiJ5k9gFEowbeNurH0dJrWWTggsthfafUul1CrkEnzVVo8iUcEfGCWWz0Hbbkc
         qDkewkdGZFHIPSgYnog92pVjBAQuesexSxTs87lr0DvW3JtcZ9PRjtJIqkG52tT3GSLV
         vfr3U/HSmHKQ5MTl6d5SGqsnFNDRAVcbcZB4yd/FbTnOTHvO4QS9vBFjhgElgAmdNj8t
         vl9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kIyVk9bbZarcjeeY9bgqvPuwyYR8Jk+BAunzdz/GBAA=;
        b=Bd9RTmE/ygZCloVGw2kQ0u0sUvvTQ7KTIYNy2L6DFYuvtxgjrf/7PftC39PhBLAIAu
         OX8wsowYuAUpLJ02qsRMkY6oO5IIbU/bjWNPCjkdERV39Zt3Y67wOG9nWqYBvm/THoFB
         cI3J5Y51oxGDkzMBKGt4ZUkCSlTjExap5J5u0ZhkcIwgkJ4wAnnCz1i9O2wT8D69kXh/
         D4aaDKQxc8VLU3dHaZ8Bp4Y4wGY6/IwaD8WjnrazGoc1zbMAz6g0C68HkN6dIe/uCSJ2
         adT005JUQFxkVGowyVsJPH9/PjgV0cx1rAcRRv6GbVQOxWhf+72lhq0n9RIdgor/Jar6
         wI6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E0XIqWbm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020ad45baa000000b004738b630659si4963879qvq.259.2022.07.18.02.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 02:25:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E0XIqWbm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDN0e-0002D6-U6
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 05:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDN0F-0002CQ-Hy
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 05:25:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDN0B-0007nu-Kz
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 05:25:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658136318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIyVk9bbZarcjeeY9bgqvPuwyYR8Jk+BAunzdz/GBAA=;
 b=E0XIqWbmfuQ4+CpS4QfnHQb/x3VOqVx6pd7XKBm16dJL7BOfGcnJmaITZsJdI+ipgRpIOr
 VB+NwZasKh1cUgT+sd6Q7wkl7PLWOW2QL4GAXDDZ5LEze/DySw7BJmKugQtDtI6cSwkgat
 DJkY/lp1Xa3HtoP8QSmKn3v+VjwqEmk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-3xp_aXAfM7Camx1QdWcr8w-1; Mon, 18 Jul 2022 05:25:15 -0400
X-MC-Unique: 3xp_aXAfM7Camx1QdWcr8w-1
Received: by mail-wr1-f69.google.com with SMTP id
 e14-20020adfa74e000000b0021e18a1c29fso334936wrd.22
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 02:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kIyVk9bbZarcjeeY9bgqvPuwyYR8Jk+BAunzdz/GBAA=;
 b=NqQ8Ab4CA1Ve9Sa1zFkUuhrp3vRfXl2+7gcufOIc8VKcTZObtLxNW1DGIwtkjZdqs+
 4TmxjTm/ZD9khpleE1ahLEnSYEGOKLGI6dELDVDhLek0mrXweYCT7dMMI90CxtIxnGUm
 8hohTgeN/UKZcWIsfGwglZMK62/LKc93Ry0ddSByFcsqZGRVDNO0iimTBR/suSjQvNbL
 L2/aEZ02WuMlz68SCTYhGu1l6b1YNfv9cp7TZ8sJYzPnaTS9x/QqjIVgpc+H/3yBiuas
 9BBJNydDEHXNhq+D/38oPZDdUTIdKbW9lLjaqhsPMRk9g1DvkpqOC5dqTrCbq4El+7mm
 +E2Q==
X-Gm-Message-State: AJIora/g90LjU9D83ELek+ovr1j6LZ7GtGnxfb6UfpU5hLy1tx2Mhhs5
 GgWkGh5QlZy04Y3MXRuCwWQMCEZM1szmPB+kceX/dB1CPSZdre/LdC+AUUgT1Vns4gzJEyL0L5Q
 dfehMopudxOlh
X-Received: by 2002:a05:6000:168e:b0:21d:b5ed:381d with SMTP id
 y14-20020a056000168e00b0021db5ed381dmr21486042wrd.241.1658136314457; 
 Mon, 18 Jul 2022 02:25:14 -0700 (PDT)
X-Received: by 2002:a05:6000:168e:b0:21d:b5ed:381d with SMTP id
 y14-20020a056000168e00b0021db5ed381dmr21486016wrd.241.1658136314107; 
 Mon, 18 Jul 2022 02:25:14 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-121.web.vodafone.de.
 [109.43.177.121]) by smtp.gmail.com with ESMTPSA id
 v130-20020a1cac88000000b003a046549a85sm18383251wme.37.2022.07.18.02.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 02:25:13 -0700 (PDT)
Message-ID: <30e66f70-a004-6789-d66a-351becaa48e2@redhat.com>
Date: Mon, 18 Jul 2022 11:25:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/3] target: RFC: display deprecation note for '-cpu help'
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220714150735.1835166-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220714150735.1835166-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: asNh1mkn3EIX

On 14/07/2022 17.07, Daniel P. Berrangé wrote:
> When querying '-cpu help' there is no presentation of fact that a
> CPU may be deprecated. The user just has to try it and see if they
> get a depecation message at runtime.  The QMP command for querying
> CPUs report a deprecation bool flag, but not the explanatory
> reason.
> 
> The Icelake-Client CPU (removed in 6df39f5e583ca0f67bd934d1327f9ead2e3bd49c)
> handled this by modifying the '.notes' section to add the word
> 'deprecated':
> 
>              {
>                  .version = 2,
>                  .note = "no TSX, deprecated",
>                  .alias = "Icelake-Client-noTSX",
>                  .props = (PropValue[]) {
>                      { "hle", "off" },
>                      { "rtm", "off" },
>                      { /* end of list */ }
>                  },
>              },
> 
> This relies on the person deprecating the CPU to remember to do this,
> and is redundant when this info is already expressed in the
> '.deprecation_note' field.
> 
> This short series suggests just modifying the '-cpu help'
> formatter so that it displays the full deprecation message
> 
> eg
> 
> $ qemu-system-x86_64 -cpu help:
> Available CPUs:
> x86 486                   (alias configured by machine type) (deprecated: use at least 'Nehalem' / 'Opteron_G4', or 'host' / 'max')
> 
> I wonder if this is too verbose, and we should just do a
> concise flag like approach, similar to QMP:
> 
> $ qemu-system-x86_64 -cpu help:
> Available CPUs:
> x86 486                   (alias configured by machine type) (deprecated)
> 
> leaving the full message to be displayed at runtime ? I'm slightly
> inclined to the simpler more concise output.

I'd prefer to keep it short here and just write "deprecated" without the 
reason. Otherwise this will overflow the lines and break the readability of 
the output. And it's also what we're also doing for "-machine", e.g.:

$ ./qemu-system-ppc64 -M help | grep deprecate
taihu                taihu (deprecated)
$ ./qemu-system-ppc64 -M taihu
qemu-system-ppc64: warning: Machine type 'taihu' is deprecated: incomplete, 
use 'ref405ep' instead

  Thomas

