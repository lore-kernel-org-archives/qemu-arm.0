Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp377389njb;
        Fri, 31 Jan 2025 04:28:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVW+2/76XbhZ0soEGzp2+VWy/8Xt8HjiacfydFrhcFpP3lrvVDaY3+yBMTDXqh3IIggAZ2JYFmRnzrotQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHLs6f3wGnlUlbAIhpeDpaOcPd2uZ/z1RhaD344Q+vW9qr00SChed3ZXjxUoix6tkXbzR3l
X-Received: by 2002:a05:620a:6201:b0:7c0:b82:8f90 with SMTP id af79cd13be357-7c00b829043mr653025885a.35.1738326539138;
        Fri, 31 Jan 2025 04:28:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738326539; cv=none;
        d=google.com; s=arc-20240605;
        b=Hy2Pkerk/k+Z1BHKvjaXeG0WDXcD51fyqaq/Qgm/BOgAfXm+fAPY87tSSJKjWNMWF5
         nYUV+5TpzWwGLKJsByIz4ciy/nL9e0ZKYl7kVtGYhl5Rm38neAM49vUOEV4G2F8jBDvF
         qhBXpE22yCfs3su6FsPXb9dFphlD0U3YEa++P/TlOKdZ20KlA4VKZynUYvfyyLFCQdzr
         WtIIhy3EBujKhLtspQk4u1olGII9uXqr/AEV1s6AAMPvU7QntxXECI0JRlYBXMz4K3JV
         7pfChbV0++tOw0V+Logh3gx2INaOnJkzA6y5LiB00uNB7dOF20aQ8H06tgrOto7TlVnh
         X0rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Poky0K4TDQhSDVgDyMz6ceB8LM4L5v2EY21iOJvxGXo=;
        fh=AqBjl5PHvhnc4RyMDL2mgc87S63PppqLM6l0lcgW3hM=;
        b=dK+9Rt2N32sMhk7pFePOwvCHZKpSWH4LZA7sL5yrEcLBncQ1PKo4zLyLXASOeDLHZB
         WJSBMny+N/+dGhjUD8fYaimQ6m4SW2f32CKnXitrMNQmSjyl1YzFfQBnK74FhEEdN1L2
         WJHeygVO3XUH8V3OAGF1nKRvvqChqpmmH8rznhelyS86/9zb+JMvFKvH5wDnJiQjf8K/
         XqQBlNmgtx8pjSwhbsWERnjAhlVIgo1/v2b9q05XAN2w3tvCesXi8cke5D9mfd+4Th3T
         I/XM3mlgtQkgjMYqD6U2OAdZA7OokdLK/qt47jNKdEjOln1bauG3DWFqwg9NSosXdKev
         qXag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IE/N1JaI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a924d27si359872085a.569.2025.01.31.04.28.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2025 04:28:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IE/N1JaI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdq8j-0004uM-Vr; Fri, 31 Jan 2025 07:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tdq8i-0004u8-G6
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 07:28:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tdq8g-0006Hj-DR
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 07:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738326528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Poky0K4TDQhSDVgDyMz6ceB8LM4L5v2EY21iOJvxGXo=;
 b=IE/N1JaIdzxVy+x1WQgrvSsCs4PVm3SU/NR12acDZAi2AVNewQ//KOttyzL/7gKQbbDsO5
 4hrFkKlb0oZtwNeP4kL+t5z7h7Boj5VPz47NGlR46NR+GxMeG2CExQ//ZAuaEYt5rLswNi
 zm81QXBR2sYusLQ3KK7obM/SjzyykQU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-Q84goJuBNo6v5vI3kTgU5w-1; Fri, 31 Jan 2025 07:28:47 -0500
X-MC-Unique: Q84goJuBNo6v5vI3kTgU5w-1
X-Mimecast-MFC-AGG-ID: Q84goJuBNo6v5vI3kTgU5w
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6d8f6903d2eso34483946d6.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jan 2025 04:28:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738326527; x=1738931327;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Poky0K4TDQhSDVgDyMz6ceB8LM4L5v2EY21iOJvxGXo=;
 b=i5zApWHRv23F4aM8gmbf/ygyOkbBCOeOwXUQzUcAJ7oM/ypYxSVfz8yjQnG4ddKo0Y
 yXdaiA3elAQyoKYq78IBD4z7bvbX1g5gQcUBhwklMTkXO6arlTuICpfcS2/G+G0tWwe6
 5scajLbuiJAmPNx6VKedD8x4BayQYfsn0ZH1YLeursa3C8bVQoRJiIaslmkqu0Qapr1C
 KXBfAtuD54uMlNAGBqVkAX8a/eBOTM9ALU/2rQ6fOam7vpnkGlqS3VKAGTpXyKbRW9oL
 Oa4Os9aKWYpxN4ZyHxliGPcEBuBPQLA79zvwLDt4xoPtF33TAPwm+Gv5iXzCvjyhbWYb
 PxSQ==
X-Gm-Message-State: AOJu0YxGLQT4avpYC9DO0RUiZhBF/yLDweeVNkrfkeAznFqX3l15sQbh
 cMp+PuYNaZKCp4HZkPav3NlzBmp+bpxKrAzokgVKmcg8sVKUr21fHGSSSu7kzOb57MImJtAAsa1
 hcRgEBgUbTbcnX+PfWrxwSQFDxXpvEXpkC66BapITkyOG2+MtOA==
X-Gm-Gg: ASbGncuZQMm9LngisD+Wae7QmDtueAQtm1sjmDcMxfTbpxbr2qGhKPoWXj6NtfYBp9E
 ZagB5PuHex2+Cf981/6Sk/OtOh6oCscEWA18VqEgyptgUmW+n3qhfqVJZvh7nxoffvNl4qO5Ml3
 4JFwLLU5U/yEZMA9UajbDI5fZLXCd+25UhmCrY1b9PZ/gbgajkRHpWCTcCgANgRNSKhmIapvPP5
 /+L/cPUEKdfMl6JfheaQTHZi1/AMdVi3+WM8qsq0Z6G/7meh4H3jWw9BWeftWhtAyoazgYJG+ii
 GW4h1xxaoyvOfydlP1ECL5N/eeDYsDBN5hLSoZ80nfM=
X-Received: by 2002:a05:6214:4188:b0:6d8:8a8f:75b0 with SMTP id
 6a1803df08f44-6e243bb8863mr179529586d6.14.1738326527053; 
 Fri, 31 Jan 2025 04:28:47 -0800 (PST)
X-Received: by 2002:a05:6214:4188:b0:6d8:8a8f:75b0 with SMTP id
 6a1803df08f44-6e243bb8863mr179529316d6.14.1738326526778; 
 Fri, 31 Jan 2025 04:28:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e254922a85sm17449076d6.81.2025.01.31.04.28.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2025 04:28:46 -0800 (PST)
Message-ID: <9f1f6879-05b1-4f87-b1bc-a364e93ddffd@redhat.com>
Date: Fri, 31 Jan 2025 13:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] tests/functional: Introduce a bletchley machine test
To: Patrick Williams <patrick@stwcx.xyz>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Thomas Huth <thuth@redhat.com>
References: <20250129071820.1258133-1-clg@redhat.com>
 <20250129071820.1258133-6-clg@redhat.com> <Z5yyYELBy6e3-ZBF@heinlein>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
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
In-Reply-To: <Z5yyYELBy6e3-ZBF@heinlein>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UswPLqdUwN7dU64QZLNnzom75ysBjZg7ObgveJEyvR4_1738326527
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: 51lFYOblRt3H

On 1/31/25 12:22, Patrick Williams wrote:
> On Wed, Jan 29, 2025 at 08:18:20AM +0100, Cédric Le Goater wrote:
>> Use do_test_arm_aspeed_openbmc() to run the latest OpenBMC firmware
>> build of the bletchley BMC.
>>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> 
> Reviewed-by: Patrick Williams <patrick@stwcx.xyz>
> 


Patrick,

Would it be possible to keep successful openbmc builds from

   https://jenkins.openbmc.org/job/ci-openbmc/

somewhere ?

As assets under :

   https://github.com/openbmc/openbmc/releases

May be ?

Thanks,

C.

