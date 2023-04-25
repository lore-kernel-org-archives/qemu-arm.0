Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3322435ejm;
        Tue, 25 Apr 2023 00:44:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350b+eCtiy3JAM42PF5VKwo4LCQgRV/e5AcGoB2CxmRjPVW1/VeuuqAVebmgtFCs8ohyV8P05
X-Received: by 2002:a05:6214:248d:b0:56c:37a:58b2 with SMTP id gi13-20020a056214248d00b0056c037a58b2mr32131724qvb.15.1682408645491;
        Tue, 25 Apr 2023 00:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682408645; cv=none;
        d=google.com; s=arc-20160816;
        b=AUpl/++ps0kLqMgSwwoIsofdPnKP89UTQi5yNbIbJqYHheDTLpfZL7UzMgW/erJwIT
         ZbnpfgEBmyLvAr8WFMc0SM8UNSb/iNlpoafZI2Uy2PyV+nrJ04xRIe25Lplec43ySVOc
         uN/XhcQHF0Jrc65EH1jgDHJMvYTAXTOLK4062lw5uVlZRKH0Q2fuj8YoDEXbg4ZR7fKB
         Y6Kztnbr7ccs2ObBL/LPUY97zOOXHw+Y4SCYymQXD5xnth502KTrR748uMJKksLnh053
         aZRzfljn33WscUv9Fa5QcbDVxq5pfyqNSM/6yoEb8YyZ31uUGCd/lC3WUKa+W2b8u07Y
         9mPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cE/PQezcLDy+h2SSkImfymZeOF7f6qAgYCUq65aUHe8=;
        b=ebUj9raLDWLaoTmyMAMOJZnEBaxJj1Xi+DGa3GQsEt23BmcGoR7rxF1ExXnFB/98Em
         eKNVGIGESaQqRb8qyAlpcR/usKBaHZIJcu9JP583qyMnTsvHDgV1auouUUwqaTKPsDPv
         oLQfvX+67pzErWhdu6Pr03stak+QNkkd3kpP95XN4s9qrvW4NsM9xMDEBt3skZifBoKv
         1dGUgprJaH5vptCvhEyoYzEyMhSlw7UqxTLKIiEfHjmP+46NDGnUFFmhxVnbG2zZopl/
         vAjBaBdkxYphZAP9rNS+l8bzVdMoeZ/yjSj13fUxtb85TCJfvXVVwNsuiWasgB5A/IYW
         n3Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S9b+OOJP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14-20020a05622a01ce00b003c009d75e39si8529796qtw.35.2023.04.25.00.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 00:44:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S9b+OOJP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prDL3-0004Jx-Sv; Tue, 25 Apr 2023 03:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prDL2-0004J9-UI
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 03:43:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prDL1-0006Lt-IQ
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 03:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cE/PQezcLDy+h2SSkImfymZeOF7f6qAgYCUq65aUHe8=;
 b=S9b+OOJPwZfyjVSYKkmgSWz8iX7tf68YL0I2NuseDHQaHxRcBJdW05gbRB9COB2A6xIONa
 WZoAmdgC4YoZhAz/IpDG/1b1kRTT5+tvl+xw5/xO+hQbXT9vqHYsc5d7LNrX6W23CnO4Db
 +R0jvrj+uShVZiROOALbhR3sCzqjfmQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-uH3Aep_QOeWFkRk6Z-lsWw-1; Tue, 25 Apr 2023 03:43:45 -0400
X-MC-Unique: uH3Aep_QOeWFkRk6Z-lsWw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f195c06507so51423285e9.1
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 00:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408624; x=1685000624;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cE/PQezcLDy+h2SSkImfymZeOF7f6qAgYCUq65aUHe8=;
 b=TrXSQhEJOQm1RzDclIcRjiCWSQfeN7bguRzs4wdqEVe9NYumrzX0RveEtARTwWnbJR
 PAUIvTNpqmbdsCaydFmRAFYzEKCLWyopSAN7pBatYROTwacj40FDfl+TQ5n2+bM+vIKn
 piItV2d+PNA/PMyx7EYxfAVGqyRXcgn5/wJMAbYU36eIetTJiaEuivsXIs/QNAX2E4ts
 6PFq2hufLEWzddPBMK+bXAxH9fgGc4E16lf4/jpq2JHpgrKI+020pD7a1v0EU2Pe35ac
 0K0raPRjIoPATeMriqUFgm//IasWa6fSJBwMep4wnyXkVOWev6hKmEtexAFM/WFr1P8Q
 3OzA==
X-Gm-Message-State: AAQBX9dLpsKi6/a111m5iy1EXhCpG8UpO8gnkIVheX4tPNkOEPo3QJ8y
 XVOAHeJDM+EpYsNYbgKF9KoYMm8hOC0N61PFlxzisdC7+xm9c9jbLrJcnNgh6Uh9piywcwmrI7I
 5kQQRqZQCfxkN
X-Received: by 2002:a05:600c:b99:b0:3f1:7619:f0f6 with SMTP id
 fl25-20020a05600c0b9900b003f17619f0f6mr9717209wmb.9.1682408624604; 
 Tue, 25 Apr 2023 00:43:44 -0700 (PDT)
X-Received: by 2002:a05:600c:b99:b0:3f1:7619:f0f6 with SMTP id
 fl25-20020a05600c0b9900b003f17619f0f6mr9717193wmb.9.1682408624344; 
 Tue, 25 Apr 2023 00:43:44 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a7bce09000000b003f049a42689sm14136881wmc.25.2023.04.25.00.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 00:43:43 -0700 (PDT)
Message-ID: <d8b2321d-79a2-f562-fe21-dbd6a9d963c9@redhat.com>
Date: Tue, 25 Apr 2023 09:43:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 7/8] bcm2835_property: disable reentrancy detection for
 iomem
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>
References: <20230421142736.2817601-1-alxndr@bu.edu>
 <20230421142736.2817601-8-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230421142736.2817601-8-alxndr@bu.edu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 2iHO5Bf0uJX5

On 21/04/2023 16.27, Alexander Bulekov wrote:
> As the code is designed for re-entrant calls from bcm2835_property to
> bcm2835_mbox and back into bcm2835_property, mark iomem as
> reentrancy-safe.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   hw/misc/bcm2835_property.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>

