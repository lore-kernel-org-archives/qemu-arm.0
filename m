Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp77896eje;
        Tue, 13 Feb 2024 04:01:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/YMeIZ5MXXXsHeU+DCQbk2xtAiK0Br+vDhDYemLTOIJIgZEIjYj9zp2MT6dL4YT2OU6Uh
X-Received: by 2002:a05:620a:21d1:b0:785:db87:ecdf with SMTP id h17-20020a05620a21d100b00785db87ecdfmr3777381qka.23.1707825660324;
        Tue, 13 Feb 2024 04:01:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707825660; cv=none;
        d=google.com; s=arc-20160816;
        b=GRffuTQP06RSmN0CwU5OajGHB7cMltv1yuevGKXvZW+vICt0nBokFNZHJLMmWJ+mKv
         1XmFIvgowMxZI3wVryU5JH6B6pxl4210ro7lChyBlvx03GBMyxZaWXYLLY97TQs4cHZr
         x6vE4xZYvJPJuqVem9VSbh0wsDj8E0niYK4THTpyaJL0z4h+jP8HCQTtLI3d3/VHTf91
         3ZJ0rDtgJYYLPK12FIlsN1AkLiUynrD9UUgXa/71GcFccNLnWMtIqm/NvwZi9v4KhGB0
         aKC5CEafMTQv/QWBeQ2qn2dj+id+OMj44vTDOdAJa5+9kBgw/+/UagbEIrZus/2UTjqJ
         lNrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=50E8y+xfA7HBXn40KtIavaY7lMTLKisuAD0rDa6/Gt8=;
        fh=vcwQh2CJ4s8/n8EHgIi0m67vEduiUeyDedD7cHLXaXM=;
        b=mmnabY8ONAgv6yp6VGlhBDvFjj0MGwGok/OiWFUytw+xdj1EjhuKELG+g6hvNgJTE2
         o2gv2vWdapeFyBEm5nHIX7vtWdNyyUUEA+LYU2GUn026SV1RYZ43slFbdFw776URBNGW
         MxYv9MzG1XgfZXiJuyDqhZDeHdZJDmf2txd+FNOMMrNupqS8IC9hZIypYY1gKyFB5CIm
         XkyLjIazzKWQOCYTUNei3dzPXrMSG6dMT/wCUG4pPvLwr3UCsApt4nMrJL+UB0TFHJWG
         LXmchMU9K+oUKIAlVedkAmKkLssQlWxlwbHcePKZ2eb4I8RgDfM3uP9n23psMMobSGTf
         0rGQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hfxwr3Pw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCXiF29mq5YDc1JPivrcz5GAr/mhcUU7NJyz7RQKsiqSZxJE62SlUNTd0Y2ck8oc5Yg90iqy/zHY9gmj6O3hQmnzrfIlWTvv
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7-20020a05620a090700b007836d3975b3si7715547qkv.273.2024.02.13.04.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 04:01:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hfxwr3Pw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZrSY-0000X7-FM; Tue, 13 Feb 2024 07:00:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZrSS-0000Vz-Fb
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 07:00:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZrSM-0000TE-Le
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 07:00:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707825609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=50E8y+xfA7HBXn40KtIavaY7lMTLKisuAD0rDa6/Gt8=;
 b=Hfxwr3PwenDrKTDr3yaUs0FbGglBZQdMDJl4TX0oYhr5ubTIE/D8MojOA1u4XX9wacDLvk
 HfPElu3pbZzX8+bz8RvNi33lQwxfL1ACoFtXfJYZIVQy2QyQKyqmflBNpGOEpmZ58t8rpw
 wvU4CyByS8+chzJLzzXTErdxopo+YOk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-Z9xFovLwPWi9JeaolxA8FA-1; Tue, 13 Feb 2024 07:00:08 -0500
X-MC-Unique: Z9xFovLwPWi9JeaolxA8FA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-410040e1fcdso24822265e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 04:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707825607; x=1708430407;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=50E8y+xfA7HBXn40KtIavaY7lMTLKisuAD0rDa6/Gt8=;
 b=Xe0w32WS5qyG3BOo11fneDjitJ9sDrLi8VKGeglgbFZju5i2NSJ5Bnq5fiXpUP22x5
 nS9mJT5Vf1r663F/8msD5hcOS1NVy0sRsNntrB/wccjSxEt+PfLIGcctwDft+If/fGPY
 Qey5IG/Ok7HkajxCXNYQqZ20JAt8Hr2+PgblrK9ZRmqRLt9gT7FI175xYJaXqmwKBGaM
 mSEyLQZ6kSvrIGNSaRlhgEMPxr2A8SJYQXOpd02iO2m6Pi3h9q6BrAB9Zn7IS+TnTMhh
 Pm3sRlKF04GKYpnMjSU5wjEzoD1bJG5BWD6XhGjwDoUhUJqtmN6OFwIAOUlZRqWiVeLr
 RTcw==
X-Gm-Message-State: AOJu0YzS7Pr/HyQVnquouv2iq6+y2cPJeP0fXvgkNZFj6lF4b2ltjBq9
 eBm3AYVkLfibEN/4VFySnlnnlU7hiwk9qADz0XsszEtEj4hBJt/aD6B3fgFxdMesSxH97Ocf6rP
 2rIv2CorTrsQuAGhixLYTr5wm5ZbqoB7LOvxxHUApQkAX2gbRjrhXSw8FTw==
X-Received: by 2002:a05:600c:5247:b0:410:8db2:d5ec with SMTP id
 fc7-20020a05600c524700b004108db2d5ecmr7468559wmb.38.1707825606830; 
 Tue, 13 Feb 2024 04:00:06 -0800 (PST)
X-Received: by 2002:a05:600c:5247:b0:410:8db2:d5ec with SMTP id
 fc7-20020a05600c524700b004108db2d5ecmr7468534wmb.38.1707825606492; 
 Tue, 13 Feb 2024 04:00:06 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUrxIgBOmS0wv7Cw55XWTtGjEL/W8neFOoe5UmvddeH7xjHYdhEumb8MOd52wG0kpomVXYtbIamcIv0/DuOmXvVpPDLciqxh4f3rXx7dJxFksh4hiYBX5/GLBN88/VQJ7lxqLmjV1s3TmBYRIrkDGPs1eZKZEMJhGih/kT0zBAB/AaNvmU9/N/NuOU0aYwF5cef/0VhTL294/WAwh9NzjtLKffHjXOcVQkI0IXzYrfFRIeIT9ytqCccSesM/h4xamiP3H7kNZ4kYlNt6yZf
Received: from redhat.com ([2a02:14f:17d:5d88:37b3:ce51:18b:36d9])
 by smtp.gmail.com with ESMTPSA id
 dv5-20020a0560000d8500b0033b483d1abcsm9390789wrb.53.2024.02.13.04.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 04:00:06 -0800 (PST)
Date: Tue, 13 Feb 2024 07:00:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, alex.williamson@redhat.com,
 clg@redhat.com, peter.maydell@linaro.org, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2] virtio-iommu: Use qemu_real_host_page_mask as default
 page_size_mask
Message-ID: <20240213064017-mutt-send-email-mst@kernel.org>
References: <20240117132039.332273-1-eric.auger@redhat.com>
 <20240213044312-mutt-send-email-mst@kernel.org>
 <6d4b5766-f8e2-4889-827d-01d3509239f7@redhat.com>
 <20240213060731-mutt-send-email-mst@kernel.org>
 <417ea71e-fb45-4e1d-b8e5-9d54d93dba3b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <417ea71e-fb45-4e1d-b8e5-9d54d93dba3b@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.504,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JRJ+FlAArul/

On Tue, Feb 13, 2024 at 12:24:22PM +0100, Eric Auger wrote:
> Hi Michael,
> On 2/13/24 12:09, Michael S. Tsirkin wrote:
> > On Tue, Feb 13, 2024 at 11:32:13AM +0100, Eric Auger wrote:
> >> Do you have an other concern?
> > I also worry a bit about migrating between hosts with different
> > page sizes. Not with kvm I am guessing but with tcg it does work I think?
> I have never tried but is it a valid use case? Adding Peter in CC.
> > Is this just for vfio and vdpa? Can we limit this to these setups
> > maybe?
> I am afraid we know the actual use case too later. If the VFIO device is
> hotplugged we have started working with 4kB granule.
> 
> The other way is to introduce a min_granule option as done for aw-bits.
> But it is heavier.
> 
> Thanks
> 
> Eric
> >

Let's say, if you are changing the default then we definitely want
a way to get the cmpatible behaviour for tcg.
So the compat machinery should be user-accessible too and documented.

-- 
MST

