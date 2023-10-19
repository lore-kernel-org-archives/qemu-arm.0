Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp443534ejb;
        Thu, 19 Oct 2023 04:32:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYT9W44v2WLoG5jHXydFkjfEKm6jhKV3qac1u4Bjz/mSjUCQd5gge4RG9TPW47IRLY7Gvg
X-Received: by 2002:a05:620a:2951:b0:774:3442:1d72 with SMTP id n17-20020a05620a295100b0077434421d72mr1770418qkp.39.1697715123182;
        Thu, 19 Oct 2023 04:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697715123; cv=none;
        d=google.com; s=arc-20160816;
        b=KDp+TRc4Oq59S48eD5sIovdW0vwW21KVb6C57QSdwmkZAkD1gMiit7e4zBD58Orec4
         vM9fO0lHCfnpWTZjzgkyKNiLw6tXYynLgGjKo53wpfI9YdmQLA+xGrkn8j8WuBgqCe0e
         TPT1kmfn6RkPdR4ldrpNHEExOWaZHCM5g3VEhQNHE9hVXxeGVwHiWM1r/Yceume/HUiB
         /kjJ80DWwMWh3rmbwiQY5IZy7OZ0vFp2r3z+bKk8+8ZkHFLYePLX/xM9dxcuU/K6trnC
         Yzbg9p/sVCwztq8Qs83jGZ7JotcStjgBi604h90TRAgTHeEz2TEy2zKPsMwhQEIlK9WL
         VHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Bn7yn/L6CuW3xBfEyBUWzp1Zh5rICznAgtSojoJxIK8=;
        fh=KdEYeBELmTo9oghg+B0864qD3gve92xSQ6qbvoSAtgM=;
        b=TvGU9ptICpkpIipC13ULAjh2EeD32NF/EqubB//Oo7J3ZfArLX/lx4B7nuIXpVrL7f
         PcfN2j8czyOMwwnHeYINUoPa61d95kCVB2lXqUxnEkN1zOQgfnRGP9OxOl8SXiSJ1zDI
         k19IEBbIhpawAH3JAprtraiO21gZ6U6wZ7+miDjmHDef6zuM/z/VuMxL4pYUGcvmIuyX
         tnCD2TDiBXLFpyD0U6X+/TyNTnXr2Dp1nMa8sRUWM62MBEVaG18U389pLd4BjN46acav
         +IFPa6GQarHHqmCWEKai33BJYCJEk37dl/CE0Lj194sSN/92p9Aj9WG38e9dtKygGIZW
         PSkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T0ZOpJLQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5-20020a05620a414500b0076eeed38118si1487436qko.131.2023.10.19.04.32.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 04:32:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T0ZOpJLQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtQtD-0002uP-Ih; Thu, 19 Oct 2023 07:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1qtQsr-0002WN-0n
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 07:08:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1qtQsl-0000jU-R9
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 07:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697713682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bn7yn/L6CuW3xBfEyBUWzp1Zh5rICznAgtSojoJxIK8=;
 b=T0ZOpJLQT+hqwVRz+Wulz1vAZLibg+IjcCfPy1Eht1rb4ym/4w23v3DRSQlzaY/BrtLdJ0
 y3aEmCz8ADiDUZMjwLlBXjtjOAtIv29OCh7sHJlrR94Y6Kj8rrjqFckP4FZTIzePH/I7bz
 R724lVwfVesiJm/jVBL8KKMWxfThtqY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-VtArIWsVPwuTEfj3m7tONA-1; Thu, 19 Oct 2023 07:07:46 -0400
X-MC-Unique: VtArIWsVPwuTEfj3m7tONA-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-41cc5b9d26eso10453291cf.0
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 04:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697713666; x=1698318466;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bn7yn/L6CuW3xBfEyBUWzp1Zh5rICznAgtSojoJxIK8=;
 b=s/jdN9t94sPr6XOL81+l+JqFqasfviRQQepmS5O/6N/Yn7xglWyQf1FVR6e9qgrL3z
 /Qq3X7VwBphxbetxUUT118GjtOR4wMqiNsFEicOfvF9vEC2LIaLqlOlWziwcLOSP+gyW
 Laten9OYsIDWlXKk3xz2v2mOVC45Ib3pEBUgmvZisV/0rycSYNWLU/bo8teesznMRqpz
 EmTUkbcd3QDHy3ZwsHQNUpxsRJoW+Ei5xfBOWYT/xcdqaZka1lQrAwqCw4XrNsymCqyu
 EFGxXmX2QwvePEVV6c/5qzZjC1yVEOQnJjjvgusCXQM9usrwc6G4+awBnjdnY6P61jUq
 /lEg==
X-Gm-Message-State: AOJu0YxGLuj3+lTuzNXp6q5sOUDH0mUAvvVWqqDapmSI7C79kgytZZko
 bdHQtA71egv1XFsuIKdZBwvEi/wQfUSQ5geSlo6hjxHagCaonVo8aZ5hEPMpq5ilbkmVeF7/Cku
 kM1JPwfGZ/Aa8PYU=
X-Received: by 2002:a05:622a:1903:b0:418:11ab:1bf7 with SMTP id
 w3-20020a05622a190300b0041811ab1bf7mr2109354qtc.30.1697713666166; 
 Thu, 19 Oct 2023 04:07:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1903:b0:418:11ab:1bf7 with SMTP id
 w3-20020a05622a190300b0041811ab1bf7mr2109319qtc.30.1697713665853; 
 Thu, 19 Oct 2023 04:07:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 c2-20020ac86602000000b004199c98f87dsm647443qtp.74.2023.10.19.04.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 04:07:45 -0700 (PDT)
Message-ID: <9ddc3f2e-8be7-4e03-bf9f-3ac930650a52@redhat.com>
Date: Thu, 19 Oct 2023 13:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/13] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, jean-philippe@linaro.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com
References: <20231011175516.541374-1-eric.auger@redhat.com>
 <20231018093723-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20231018093723-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
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
X-TUID: uz/457td7TFC

On 10/18/23 15:37, Michael S. Tsirkin wrote:
> On Wed, Oct 11, 2023 at 07:52:16PM +0200, Eric Auger wrote:
>> This applies on top of vfio-next:
>> https://github.com/legoater/qemu/, vfio-next branch
> 
> virtio things make sense
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> let me know how you want to merge all this.

Michael,

I will grab the series if that's OK.

Thanks,

C.

