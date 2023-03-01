Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp7473496ejc;
        Wed, 1 Mar 2023 14:19:58 -0800 (PST)
X-Google-Smtp-Source: AK7set8xcPlhtF7KkpO7mU1Tq1TOsYpcnayQ0vC0i2lXjeoLTKUKADOWIBzhH+MwrTj7ZnNRvIKr
X-Received: by 2002:ac8:58c9:0:b0:3b6:5fc7:f554 with SMTP id u9-20020ac858c9000000b003b65fc7f554mr75787qta.7.1677709198001;
        Wed, 01 Mar 2023 14:19:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677709197; cv=none;
        d=google.com; s=arc-20160816;
        b=qWL05gOnUOmr++FF4FRfJHdZLJQ+NbC71elg61An6LAzNqmBVNwe3yr0wh3jyL0/o1
         7B2fDjSYEPQOWYsLXM25BZ537NPSZmVH0GVP69u9RysW8D3EZxmN2ExuPzBsjeUjcwYX
         PZVFigjj0raOwIIqHAdQd38kwY6H9L31bBCF4EPUBYu6dkLFfBt46HXyKr4QAZ1Ks2E9
         k0n86hl16IEJkBVqD5WBdIalFr7BameRNJlHTWQz8WDY0gPD/3clDskM+sGCibXW1p+a
         cTFvoJKxJcWE+KyAyPjhvHFV9NVSj9ZYNqY64F7pqc+Fh8FC2nX2gnxnNg4+ebuAGkWj
         43dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=gEZMnp3771gv5eYO4rbQY0LOaiYVb7iXkQat+LC38sU=;
        b=xfL2MAEosHgMdgn7ZrlasIVOAAZYp5+abSvMf9ChxXJDQPKW6/hBeKp1QxJ5VqAAO2
         yCPT0ZtglsGQsCinvg2wtAKN+uqgL/NdSMGXJFOva3Ekmq0/ct+YAQfxxU/7H7ey8JGV
         U4jhe2Ljt7kQ8ARhVuxCmlp6JMjXD9OtLWbWTDg/GlasrqNt+hwF6CVtCL+qI1vBmr6/
         mLzctp2ZPmxK0jTVr2z8z4/ttSrBlM82u+jXPi7t67hNpuF3yaW7e7Co2sud4f5gjZGr
         dID7ZvwZX0JL5qgzNXuBqEpk+lP2ADKnAl4P7pdoa9G8OP0295nJRnZTpcAt7tfDg/X4
         UDBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fx+KugTa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t25-20020a05622a181900b003b859f1e967si11491894qtc.176.2023.03.01.14.19.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 14:19:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fx+KugTa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXUnG-00079f-5Z; Wed, 01 Mar 2023 17:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUnE-00071h-Ic
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 17:19:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUnB-0002dp-SS
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 17:19:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677709160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gEZMnp3771gv5eYO4rbQY0LOaiYVb7iXkQat+LC38sU=;
 b=fx+KugTaio4yjAMB32LyREwQQDN7L1o3xn8Qqs4KIvngJ1xEfaZhA2DhR2zcPzXdO7C5pW
 lO97AhI3jSpJUfMfQ4oI2N5aEYZjN2N9NHHbXUINcHEWBzu4JJ4b6gHkNqrXr1RzCxElvg
 oSZeZF/GzyGwhP8g5jInGMlbqRvDgfo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-TvdgfxkyPrG14gaGp5utEw-1; Wed, 01 Mar 2023 17:19:19 -0500
X-MC-Unique: TvdgfxkyPrG14gaGp5utEw-1
Received: by mail-wm1-f71.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so266729wmj.4
 for <qemu-arm@nongnu.org>; Wed, 01 Mar 2023 14:19:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677709158;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gEZMnp3771gv5eYO4rbQY0LOaiYVb7iXkQat+LC38sU=;
 b=b6lYTziI+YpOrI4vb/NA33FFo5rAqd1+3GZeB0rJxX41wmw61cJadoBP87XD3zY42E
 CbawCG0fa/M/6lnpOenCjCZ29FpTnySlO5nNjkgDYEB0NCGpJTwnR80KXVYR7P4LsLbt
 RfNreejgjd7gvCY6XgJfRZ/YAcBoGppkarR7+rw4dSgLvUKGuY0QT+i3vULxYOVur6Wk
 d9zGl772h86UymJXKwmmrx27ReTm5tGmwL61K0bBsb7uk81fGQOBuFbnLqd51b6lDadn
 4Vi1H/TfrXA1Qur0sUBl0MVGK51pnjhvilVp7Mdxo3337aRNIllz4UyPmIzv+4x4O+S9
 GOKw==
X-Gm-Message-State: AO0yUKUjESVlayzZlE+GBtllZ5Y8jvJcrWtAj4tHKbLnD+we2eD6Xzna
 ar2ZqlYQ/1idceBvSvFgq/kEt7uRm0JcPWr51rKxe8APSxA2g1Y+SlR3mMwG1RtGYRISN82M7Si
 6iD8n5BU7/zpC
X-Received: by 2002:a5d:59c2:0:b0:2c5:4c5e:412b with SMTP id
 v2-20020a5d59c2000000b002c54c5e412bmr11385036wry.23.1677709158433; 
 Wed, 01 Mar 2023 14:19:18 -0800 (PST)
X-Received: by 2002:a5d:59c2:0:b0:2c5:4c5e:412b with SMTP id
 v2-20020a5d59c2000000b002c54c5e412bmr11385004wry.23.1677709158116; 
 Wed, 01 Mar 2023 14:19:18 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 ja20-20020a05600c557400b003eb596cbc54sm897392wmb.0.2023.03.01.14.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 14:19:17 -0800 (PST)
Date: Wed, 1 Mar 2023 17:19:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH v7 00/23] Consolidate PIIX south bridges
Message-ID: <20230301171819-mutt-send-email-mst@kernel.org>
References: <20230212123805.30799-1-shentey@gmail.com>
 <A5067C75-87DB-4D58-B49E-97BEDF303831@gmail.com>
MIME-Version: 1.0
In-Reply-To: <A5067C75-87DB-4D58-B49E-97BEDF303831@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: ZLQZ4mNm75ru

On Thu, Feb 23, 2023 at 05:25:23PM +0000, Bernhard Beschow wrote:
> Ping
> 
> Can we queue the piix3 part already? Now that the series doesn't introduce a PIC proxy any more the piix3 part is essentially QOM cleanup.
> 
> Note that I cautiously dropped some Reviewed-by tags in the piix3 part as well.
> 
> Best regards,
> Bernhard

This conflicts with ICH9 cleanup - I guess once that is merged you will
rebase right?

-- 
MST

