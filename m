Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26018CA1005
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 15:51:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utTHs-0006MC-Ri; Tue, 02 Sep 2025 11:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1utTHj-0006IW-RP
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 11:51:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1utTHc-000086-BX
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 11:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756828252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O1z93Pub6Mp61IS2E3/nCiNg21wlLukxFEpvL9CDvMM=;
 b=CNvMCcJEYVMHp/lY2ep1bN78LfL9UpgW1m9cH0ZK2MZcQNDvOY99Pmc+QkVYEuRE7KeNBE
 yKK4OwbqorFD71w1LVZLzIMEOA+A2ORII3JwDcxTbFOqleDgckUP65XjxMYyyiFOC57tB2
 xDU91idziNaxeNXsn6dRlYPNYgkdtQU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-6RTeNBSnP36QRDt30FKk-w-1; Tue, 02 Sep 2025 11:49:37 -0400
X-MC-Unique: 6RTeNBSnP36QRDt30FKk-w-1
X-Mimecast-MFC-AGG-ID: 6RTeNBSnP36QRDt30FKk-w_1756828176
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45b8af0b986so46955e9.1
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 08:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756828175; x=1757432975;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O1z93Pub6Mp61IS2E3/nCiNg21wlLukxFEpvL9CDvMM=;
 b=RKvmnK5FbkcMxyG0ETLTv2Ecv5eETwTiGnYux42g6QK/75mMqjPujbTUspjtKKGyST
 MRL3vgrEZHfoJiQFRJET4U4FSmnyldIr2A9hrTffJVdZeCtPco1WjkKw+2Y7X8xs2Adb
 s8Ikg86sYDaqcQ5uksiKbaRN5DsjNSGZtC3wRK/4U9nfQgMp0tZqw9PSfTNREcU3vrlR
 Z2o82YTWeDxF1uWTeD3OZgYG4ASVNSUEPauqpDm+O4QmrOnk3YJEXjdnxcr3llMrDt7V
 AAFAqGFD7YuzxQkXxUPOlWhVa6E/mu5a3l+FQi0Afn7CcIu7sJZdu6PjrT+OlrmgPe2k
 wmHw==
X-Gm-Message-State: AOJu0YxrSJo6LKK2qyn1reUxYPGJiPe3aW9k+UmxtAaE/G9fn6NItSzr
 0zAOsVJvnDbA6XxNU9Mw8f8j0bF8EKS9nZIH3D8D1H3dHr3b6FXaJuFeX/GGaFQZ67UCYmzu2f6
 DNgnlDojNMdAlmdEcDyKXiFqU56UIn0TweK3/i4TPyuk8VP5F0zAh+g==
X-Gm-Gg: ASbGnct7F3eYMu4cFItTELv5TGWbou+fBOOTQpxClmyknAIZR3p0Asni+Sau/iir62Z
 ov74R5MAtjDPQTyGdOtIqESlDboRiUx2gq2KQ262m4x+wyIUYRi1+EBTkPQ6jm1fSJn/FwspQI+
 wXoUfMn23wVVNXkYH0CJe/jwXZS+POgjywptOrvDrKkJUtc14/qpAAHf5j38f0sKBquTCRQ0EY8
 dU8KmAWtTJ1+9S7W0KW8ATrttu3N8UjhMgo6en1W+H71CWfaKLbc588eMmrwLcrcPZ/qtfI09PW
 xjsz1FFQeQKudGA1x6E07jNugHR3WXpfnZPCYmqS8twrlNUWxB9rXhL+BKToh1rxDd4yzk7t512
 yF9gBPqCgYu24SA==
X-Received: by 2002:a05:600c:6818:b0:45b:733b:1feb with SMTP id
 5b1f17b1804b1-45b84c58673mr87438045e9.10.1756828175627; 
 Tue, 02 Sep 2025 08:49:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5F50p2Jjn0NMfNYTGSC0rcw62uzpx0Pd6HVdBpsVpb0sq/at7wOiHh5kJ9Fz2RTvLmDE2QQ==
X-Received: by 2002:a05:600c:6818:b0:45b:733b:1feb with SMTP id
 5b1f17b1804b1-45b84c58673mr87437855e9.10.1756828175189; 
 Tue, 02 Sep 2025 08:49:35 -0700 (PDT)
Received: from rh (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de.
 [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d1007c0dc8sm18485519f8f.53.2025.09.02.08.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 08:49:34 -0700 (PDT)
Date: Tue, 2 Sep 2025 17:49:33 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2] arm/kvm: report registers we failed to set
In-Reply-To: <20250902092732.706338-1-cohuck@redhat.com>
Message-ID: <eecb8e82-f4a3-5def-30ff-690082f6b582@redhat.com>
References: <20250902092732.706338-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gHPratXwdHktcnuseBu401M2g4uZTPmyHSIpskRn5rc_1756828176
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 2 Sep 2025, Cornelia Huck wrote:
> If we fail migration because of a mismatch of some registers between
> source and destination, the error message is not very informative:
>
> qemu-system-aarch64: error while loading state for instance 0x0 ofdevice 'cpu'
> qemu-system-aarch64: Failed to put registers after init: Invalid argument
>
> At least try to give the user a hint which registers had a problem,
> even if they cannot really do anything about it right now.
>
> Sample output:
>
> Could not set register op0:3 op1:0 crn:0 crm:0 op2:0 to c00fac31 (is 413fd0c1)
>
> We could be even more helpful once we support writable ID registers,
> at which point the user might actually be able to configure something
> that is migratable.
>
> Suggested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

I did some basic tests - this one looks good!

Reviewed-by: Sebastian Ott <sebott@redhat.com>


