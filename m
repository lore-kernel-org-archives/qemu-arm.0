Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp765869njc;
        Fri, 6 Jun 2025 01:08:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWr6PSiL9JBHxztsPKDX3wnmUfaiBl/ld0hNSln6fcbxDBsNA3I/ltCg+Bsb4nI079mOGJY1d1OLXsQlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHHQXD+3GeS6VS7wbMvM9WumcFgZlrNl3ZwoNhZfgMqYpEuXSYwGG1cHQFkIWZfGuJdd0tC
X-Received: by 2002:a05:620a:2a13:b0:7ca:cd16:b433 with SMTP id af79cd13be357-7d2298966bdmr387719885a.31.1749197305818;
        Fri, 06 Jun 2025 01:08:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749197305; cv=none;
        d=google.com; s=arc-20240605;
        b=NnjtmZMstul8eRI8Lls8uv7Oy4CwCbyofJDKHXGjD9B5nFwAT3rhg7Qdb6xeU8jZbU
         l7vIuJ6xlmHGn0Pxmkq5bX45gTmres2eaQYiT/sHWfm/BLngIbrqzxDc/FKbDAv81fjc
         mJ9HHJ8WFZDHCg2OXPSZNXEP3dlqDGILGYKt20eMz73H/LN3q5iidMg3ISWS93raaGmy
         XY56CvqS/bKnM4pIWhR5/eVI+9rk7dlAfG8+Q/8mPS3YtWtDW2O4nuyowsLB2KNoZCJ4
         RCtymQ62GCx7ydXqJGAR3AyYuOqQMP/NkeWZY6QEh7XUp6eYkwT8zaeyjWoAMYS43i8Y
         F77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=9fmzYjKqR6+8EbYEeV/irp7fd7mrp+KmEPT6BuDbM1M=;
        fh=ydyNT9E2q23kV4kSXEevumSPKVP9MJ6Vptmf/0Nib/Q=;
        b=g0p+DEdrrowpRxjDEwj2MXnqoctbitOHL1qBTkgSCDlKLcTQJ8JWnKQGbhLEQv5qgk
         Xk8JKNBaPIrUfF4byRFZUHIlkbGMORsqT2eWwMV2zCFuW3bIz9u61BZ5BgRukeoohGCN
         wMuZfVX3nTWSYxrzi0z64rgre23EdXTuDRfFrHRDcCibCw1anQntfJzCBJas4IyWWMgf
         jhyjiKpDmsy+sRp265IXmVm40f2uozd1kb945VnUiqnGv2zT4yAMIS9wWb2u4lkja15j
         efWSClv4n2R05E/rSYzTq921mQo2grlrsejQ2l84WIijz9wWcoE7f3GhAdke3rSzo2Vq
         lz8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JMKZu0y7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d25e60f205si123755085a.533.2025.06.06.01.08.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jun 2025 01:08:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JMKZu0y7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNS7Y-0001TE-Mb; Fri, 06 Jun 2025 04:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uNS7S-0001RL-0q
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 04:08:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uNS7P-0005xG-0q
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 04:08:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749197281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9fmzYjKqR6+8EbYEeV/irp7fd7mrp+KmEPT6BuDbM1M=;
 b=JMKZu0y7cnd3rRmBHGKIr5CEgCNnq2DXwADiQ714pyAPwjvOsdHlzAtJGrHTU4kI0vQ1a5
 A+2CckvCWAMVAt2AjOvnZoNgZr+YosWuRpjijXsuIVKmNV/9672JPwmRab7wV+fr5nSv3r
 djEYsVQfV5YW0qolfysL2/I7UM4rKD0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-D6bDZR4GPBea0evXz1aFzA-1; Fri, 06 Jun 2025 04:08:00 -0400
X-MC-Unique: D6bDZR4GPBea0evXz1aFzA-1
X-Mimecast-MFC-AGG-ID: D6bDZR4GPBea0evXz1aFzA_1749197279
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-39ee4b91d1cso1461151f8f.0
 for <qemu-arm@nongnu.org>; Fri, 06 Jun 2025 01:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749197279; x=1749802079;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9fmzYjKqR6+8EbYEeV/irp7fd7mrp+KmEPT6BuDbM1M=;
 b=ZB9lRyN5aLXT4FAT9CnLoagTL0XZHJnBKAFc47VGYBN2vcP+THmP1Du3SXliks4CXG
 rGXn73Oj3m5PUGXVWdQ38wwKa5kTpPXJigYDgvfREmWBp6eL+X2gojEDx6gHy6cIQgPD
 gldNGcvcOlIGaN07QAi+7ApurvtqdF1UUl5cGwsFCkgUH5Zj19zZdvEvjIPyGzr+ZTdB
 3ZnHHJV1JkmGEBnCAq1peOABzv71pLkoNNaUTNfRa6FNZbtp8l8CC/EVpqeF0deNlV8d
 TGsEGmoilFvOxKj9b87Z1kfsM1p1TUZlrQlv/gAZwLFNJaTTyGx+1q2V/SFNBAzRDZJN
 yNbA==
X-Gm-Message-State: AOJu0Yw3Z1Egngkb3UVCc1578ajYZMifDHOXd9vWXzFgqx3dKH8VpVlL
 TwZcI1IQN8scfqIUH2/JyiX0w/101c5gbUtrNT3dFpOSJoLIaqlYu2u7OlRgx9LR7X/DxfHb5YN
 +j/GAz3+ywLcUZ699jIjusK3O2o3QEQBkMXPK/JY85G29AJy4K2PINw==
X-Gm-Gg: ASbGnctKpjWnQE3ZwGpczhNmpNDOQzHShgW5V3Q0xf9rx41LUZDIBiBcUdA4qHAqarK
 BtDB9r8cq1tv2aZlDQGT9Wn7BK4p6zUQnduvC3aHXkgPWzIYcLKDokg288W1eE/HB0BSwO7s5kj
 s7Owa3vxdw5gWgTJF7J/j1XIn8JXKq3GkWva3K2jP7936FeZnP0zqeI7ySJabMB0flCFKQNakwV
 Bm8SymBzAczgiak1zNV+MXl+KOu41vmnXGW5gYUeSVzhOlIHJSYuwJvC4+7kJlSvzNaVSBL9pcN
 yqYfxwEnPM1xyzCFuPAne2hZLTC4h4J1J5sFTRXy8InIwyJ8KA==
X-Received: by 2002:a05:6000:40e1:b0:3a4:e238:6496 with SMTP id
 ffacd0b85a97d-3a526e0cc1dmr6169365f8f.18.1749197279206; 
 Fri, 06 Jun 2025 01:07:59 -0700 (PDT)
X-Received: by 2002:a05:6000:40e1:b0:3a4:e238:6496 with SMTP id
 ffacd0b85a97d-3a526e0cc1dmr6169334f8f.18.1749197278795; 
 Fri, 06 Jun 2025 01:07:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4521375a392sm15432825e9.36.2025.06.06.01.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 01:07:58 -0700 (PDT)
Message-ID: <c373ee81-d094-4b40-93c9-5ece6e24e520@redhat.com>
Date: Fri, 6 Jun 2025 10:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ramfb: Add property to control if load the romfile
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Shaoqin Huang <shahuang@redhat.com>
Cc: qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
References: <20250606070234.2063451-1-shahuang@redhat.com>
 <aEKeNSc8mAZ8vhGj@redhat.com>
 <cf34f5b2-d422-453f-85d4-15938ae59e9f@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 xsFNBFu8o3UBEADP+oJVJaWm5vzZa/iLgpBAuzxSmNYhURZH+guITvSySk30YWfLYGBWQgeo
 8NzNXBY3cH7JX3/a0jzmhDc0U61qFxVgrPqs1PQOjp7yRSFuDAnjtRqNvWkvlnRWLFq4+U5t
 yzYe4SFMjFb6Oc0xkQmaK2flmiJNnnxPttYwKBPd98WfXMmjwAv7QfwW+OL3VlTPADgzkcqj
 53bfZ4VblAQrq6Ctbtu7JuUGAxSIL3XqeQlAwwLTfFGrmpY7MroE7n9Rl+hy/kuIrb/TO8n0
 ZxYXvvhT7OmRKvbYuc5Jze6o7op/bJHlufY+AquYQ4dPxjPPVUT/DLiUYJ3oVBWFYNbzfOrV
 RxEwNuRbycttMiZWxgflsQoHF06q/2l4ttS3zsV4TDZudMq0TbCH/uJFPFsbHUN91qwwaN/+
 gy1j7o6aWMz+Ib3O9dK2M/j/O/Ube95mdCqN4N/uSnDlca3YDEWrV9jO1mUS/ndOkjxa34ia
 70FjwiSQAsyIwqbRO3CGmiOJqDa9qNvd2TJgAaS2WCw/TlBALjVQ7AyoPEoBPj31K74Wc4GS
 Rm+FSch32ei61yFu6ACdZ12i5Edt+To+hkElzjt6db/UgRUeKfzlMB7PodK7o8NBD8outJGS
 tsL2GRX24QvvBuusJdMiLGpNz3uqyqwzC5w0Fd34E6G94806fwARAQABzSJDw6lkcmljIExl
 IEdvYXRlciA8Y2xnQHJlZGhhdC5jb20+wsGRBBMBCAA7FiEEoPZlSPBIlev+awtgUaNDx8/7
 7KEFAmTLlVECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQUaNDx8/77KG0eg//
 S0zIzTcxkrwJ/9XgdcvVTnXLVF9V4/tZPfB7sCp8rpDCEseU6O0TkOVFoGWM39sEMiQBSvyY
 lHrP7p7E/JYQNNLh441MfaX8RJ5Ul3btluLapm8oHp/vbHKV2IhLcpNCfAqaQKdfk8yazYhh
 EdxTBlzxPcu+78uE5fF4wusmtutK0JG0sAgq0mHFZX7qKG6LIbdLdaQalZ8CCFMKUhLptW71
 xe+aNrn7hScBoOj2kTDRgf9CE7svmjGToJzUxgeh9mIkxAxTu7XU+8lmL28j2L5uNuDOq9vl
 hM30OT+pfHmyPLtLK8+GXfFDxjea5hZLF+2yolE/ATQFt9AmOmXC+YayrcO2ZvdnKExZS1o8
 VUKpZgRnkwMUUReaF/mTauRQGLuS4lDcI4DrARPyLGNbvYlpmJWnGRWCDguQ/LBPpbG7djoy
 k3NlvoeA757c4DgCzggViqLm0Bae320qEc6z9o0X0ePqSU2f7vcuWN49Uhox5kM5L86DzjEQ
 RHXndoJkeL8LmHx8DM+kx4aZt0zVfCHwmKTkSTQoAQakLpLte7tWXIio9ZKhUGPv/eHxXEoS
 0rOOAZ6np1U/xNR82QbF9qr9TrTVI3GtVe7Vxmff+qoSAxJiZQCo5kt0YlWwti2fFI4xvkOi
 V7lyhOA3+/3oRKpZYQ86Frlo61HU3r6d9wzOwU0EW7yjdQEQALyDNNMw/08/fsyWEWjfqVhW
 pOOrX2h+z4q0lOHkjxi/FRIRLfXeZjFfNQNLSoL8j1y2rQOs1j1g+NV3K5hrZYYcMs0xhmrZ
 KXAHjjDx7FW3sG3jcGjFW5Xk4olTrZwFsZVUcP8XZlArLmkAX3UyrrXEWPSBJCXxDIW1hzwp
 bV/nVbo/K9XBptT/wPd+RPiOTIIRptjypGY+S23HYBDND3mtfTz/uY0Jytaio9GETj+fFis6
 TxFjjbZNUxKpwftu/4RimZ7qL+uM1rG1lLWc9SPtFxRQ8uLvLOUFB1AqHixBcx7LIXSKZEFU
 CSLB2AE4wXQkJbApye48qnZ09zc929df5gU6hjgqV9Gk1rIfHxvTsYltA1jWalySEScmr0iS
 YBZjw8Nbd7SxeomAxzBv2l1Fk8fPzR7M616dtb3Z3HLjyvwAwxtfGD7VnvINPbzyibbe9c6g
 LxYCr23c2Ry0UfFXh6UKD83d5ybqnXrEJ5n/t1+TLGCYGzF2erVYGkQrReJe8Mld3iGVldB7
 JhuAU1+d88NS3aBpNF6TbGXqlXGF6Yua6n1cOY2Yb4lO/mDKgjXd3aviqlwVlodC8AwI0Sdu
 jWryzL5/AGEU2sIDQCHuv1QgzmKwhE58d475KdVX/3Vt5I9kTXpvEpfW18TjlFkdHGESM/Jx
 IqVsqvhAJkalABEBAAHCwV8EGAECAAkFAlu8o3UCGwwACgkQUaNDx8/77KEhwg//WqVopd5k
 8hQb9VVdk6RQOCTfo6wHhEqgjbXQGlaxKHoXywEQBi8eULbeMQf5l4+tHJWBxswQ93IHBQjK
 yKyNr4FXseUI5O20XVNYDJZUrhA4yn0e/Af0IX25d94HXQ5sMTWr1qlSK6Zu79lbH3R57w9j
 hQm9emQEp785ui3A5U2Lqp6nWYWXz0eUZ0Tad2zC71Gg9VazU9MXyWn749s0nXbVLcLS0yop
 s302Gf3ZmtgfXTX/W+M25hiVRRKCH88yr6it+OMJBUndQVAA/fE9hYom6t/zqA248j0QAV/p
 LHH3hSirE1mv+7jpQnhMvatrwUpeXrOiEw1nHzWCqOJUZ4SY+HmGFW0YirWV2mYKoaGO2YBU
 wYF7O9TI3GEEgRMBIRT98fHa0NPwtlTktVISl73LpgVscdW8yg9Gc82oe8FzU1uHjU8b10lU
 XOMHpqDDEV9//r4ZhkKZ9C4O+YZcTFu+mvAY3GlqivBNkmYsHYSlFsbxc37E1HpTEaSWsGfA
 HQoPn9qrDJgsgcbBVc1gkUT6hnxShKPp4PlsZVMNjvPAnr5TEBgHkk54HQRhhwcYv1T2QumQ
 izDiU6iOrUzBThaMhZO3i927SG2DwWDVzZltKrCMD1aMPvb3NU8FOYRhNmIFR3fcalYr+9gD
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <cf34f5b2-d422-453f-85d4-15938ae59e9f@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yhQJf0M_G2vXPOGp7bvwWiHYvT3VQ2fPfkG8TfzpvBY_1749197279
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: aHUgTqnT3v0A

On 6/6/25 10:06, Cédric Le Goater wrote:
> On 6/6/25 09:52, Daniel P. Berrangé wrote:
>> On Fri, Jun 06, 2025 at 03:02:34AM -0400, Shaoqin Huang wrote:
>>> Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
>>> the x86 need the vgabios-ramfb.bin, this can cause that when use the
>>> release package on arm64 it can't find the vgabios-ramfb.bin.
>>>
>>> Because only seabios will use the vgabios-ramfb.bin, load the rom logic
>>> is x86-specific. For other !x86 platforms, the edk2 ships an EFI driver
>>> for ramfb, so they don't need to load the romfile.
>>>
>>> So add a new property use_legacy_x86_rom in both ramfb and vfio_pci
>>> device, because the vfio display also use the ramfb_setup() to load
>>> the vgabios-ramfb.bin file.
>>>
>>> After have this property, the machine type can set the compatibility to
>>> not load the vgabios-ramfb.bin if the arch doesn't need it.
>>
>> Can you make this a series, with an additional patch that updates the
>> current in-dev machine types to use this new property, so we're clear
>> about the proposed usage.
> 
> yes. And please change the vfio-pci property name to use underscores.

Sorry, to *not* use underscores : use-legacy-x86-rom


Thanks,

C.


