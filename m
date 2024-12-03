Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3575172njk;
        Tue, 3 Dec 2024 02:34:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXmERUMW9Ya6G+/NIdoy9xQCKhlE0LarIsyIguBuSVy71X+St9TPMx8NKpO3G/Q+bBMFn4lsUI1U9boCw==@linaro.org
X-Google-Smtp-Source: AGHT+IE3f4mV/qrFqPYpjwWx/nwOT0zLAIY/K0RSv3a4GO4pydkYh9y5K/4tulGW0imBTPvx/hWN
X-Received: by 2002:a05:622a:654:b0:466:84ef:e75a with SMTP id d75a77b69052e-4670c090512mr26850361cf.12.1733222075672;
        Tue, 03 Dec 2024 02:34:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733222075; cv=none;
        d=google.com; s=arc-20240605;
        b=fOwqgdKqN03IPHm6qVo/aEd2qMbt69vL2bGzwbYJojyXoC3kdpn69p3Oxq9Xev4V2l
         8F5RKltvrRn4ZnijWcohxG88xaTaXKDjsvuk1gJTIczfyEeLXTrgOTBermAXukABseEa
         N6YX33HpEa82603vtWolXxL+ITwKCUqegQjFWzhUwR8H3zye9xUbBo67gCIvD4vguXcw
         CG5OtSx0OWpPOE5H/eZHFhuvi+Fy3ACbu7BO3ShPt6jwWv8+5Y4MOWj+oRZnFYwSxWwE
         hj2PId6FUyXRWq3ZTgtBKiEVIgxJ8fjCE3XFvtUQhL8Y2eKKNJaT+PbmnG0N/u8lk3rP
         ynIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=c8+mtyeu29sdyoeKiIX8Wc5RPqMhIGCC9Pt4TP7ecf4=;
        fh=s/HjdV2RQRQmiAWZTHvywcaY00E6l+Tb7HngDtI/khU=;
        b=Yx6CGEIs62ACkxVXI3aBS75mDJL91hDAf8PcEyJlK2fRbdM91QbzlSOr9XfECsgOL+
         UhZ/lxIdN8TKlGDYkK42BpmnSnMoHLvd/iI/axrCAGKP+pLga1k8Uu2aMi2+W2HtBBrG
         k5ja6OA03+oqhDLZjuclS3Fa7mqHQhewK5W98jgRS+Cyb7t0/OKI3ZgMhpfOyIDtnQnz
         UiYxop6LRjGwRzquPR//+tCxPJbsIDzAq4yv22oKKzVoAk9+FIxG3X5mJ+ezuooaCFMl
         VCgCQj+U2KFt+9UmXRysdS/u8HqgKRPPQNp8ga2rNgNjGgv5t/e2dzh2v9bCszcyvAck
         JtgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cJqHL1FU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4054727si160454661cf.90.2024.12.03.02.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 02:34:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cJqHL1FU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIQEe-0002d9-6o; Tue, 03 Dec 2024 05:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tIQEc-0002cf-0A
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 05:34:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tIQEa-0002Nh-OA
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 05:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733222063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=c8+mtyeu29sdyoeKiIX8Wc5RPqMhIGCC9Pt4TP7ecf4=;
 b=cJqHL1FUPDVrg3aN5BY3BEBlF/rtphem34aLZEAbI6q8hiKviHf2c+rggFNYQWRkrR7Ad8
 aH0j5Brin/hbDLKWN/GVcVX+gBm5gyK0vGaBZauHlSEXMA2J9np9py30bCwi+6mvfdkKvs
 W8MbKIt2XHCqWDr2M1hAO7oGPKmws1Q=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-EubbYE11Ni6pxO6MPZyjFw-1; Tue, 03 Dec 2024 05:34:22 -0500
X-MC-Unique: EubbYE11Ni6pxO6MPZyjFw-1
X-Mimecast-MFC-AGG-ID: EubbYE11Ni6pxO6MPZyjFw
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3ea530ff9d7so3862890b6e.2
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 02:34:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733222061; x=1733826861;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c8+mtyeu29sdyoeKiIX8Wc5RPqMhIGCC9Pt4TP7ecf4=;
 b=o0gRHz1Io8VkCs0oAY+xpON/bCga0GqCIXEw4stZjuvPWyMvHGQgkj4er6nrCZ1yUn
 T8eDFlGJuymTd/GZNoyVhUEEYJnx7rQ0hvBETtxCQb9K/zpV95RrZh4RJiL84Ws0KDdi
 AJjXHwbSk32vM+v5chiS1EErHHL0VotzAkJLjSPdWwF4WZRH7VEeAFayE+MJnvqvxOO9
 Mq8T+/d0jxKRXZUiClpkzxeojGslediKvmzhwpgzJsdDlpZYoyc88ifZyH21Otj5MSNu
 7DzzodZdXPgpQYbNPcVANz3U82j1RTvm46qUCsll2TiRRHjKDl9y43b7DHklNbIn2Rex
 aDog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYmZ5Ml1r754D9XA7yQQ2SSokKOMZxWoDWh0KSSQdaEBlNm9eL7prUjqXcrQh3gaJLIfvIc9uIQg==@nongnu.org
X-Gm-Message-State: AOJu0YxH7lXoSuNtI/t5oyoRWOMm2iV9zY2UFojVCuqrE5qh3e+kjp1j
 cXBX4v3RZDApsZq/VzWqdAEdgT7aSR+E4Gn2wUNnsD4KPwVG5oD+U/SoBwPYUvjOdJHTSH2pKE5
 qWV/bVNaxTxmfGJkN0F+layBcpHqCd7FwClPY95HmBT2bbueN4Q==
X-Gm-Gg: ASbGncsdokdCr2qNY3JwQ8uxWWdxtr+fLd4/UcFpfjry/8Zc8yCLigPRZWo0WtEGCV8
 /ymHHe7IKwSAaX/YtDmtttlxVh2tIgZES9fuhFgnZdGE/yMzKXjPJPtP+3iNQUblX1vDfvoEuYf
 Cjfj5IXIihQAioB3Ps8zJKmaIqg+WrV8tH5dmMSCL1aKLhPHjBDsOQMkv5FUw/cACbwscPnMV/I
 vSr84e69mQEB4fg5+zm+nsh3nqzYxxPfEwdbqxjPWx4fDTI9WjtYQxyO2+iaCqLWmJkHgBgFWAi
 MIniLw==
X-Received: by 2002:a05:6808:e8b:b0:3ea:50a8:4559 with SMTP id
 5614622812f47-3eae4f3644dmr2105745b6e.11.1733222061692; 
 Tue, 03 Dec 2024 02:34:21 -0800 (PST)
X-Received: by 2002:a05:6808:e8b:b0:3ea:50a8:4559 with SMTP id
 5614622812f47-3eae4f3644dmr2105729b6e.11.1733222061475; 
 Tue, 03 Dec 2024 02:34:21 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-199.web.vodafone.de.
 [109.42.51.199]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d896a2a706sm36364946d6.112.2024.12.03.02.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 02:34:21 -0800 (PST)
Message-ID: <0715a97a-5b59-45c9-acd0-a1357a6ffa86@redhat.com>
Date: Tue, 3 Dec 2024 11:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] accel/kvm: Remove mentions of legacy '-machine
 foo,accel=bar'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-7-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241203092153.60590-7-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SM79EViTkmNG4Y4MX4cEmfbmYq6_L568aw5m4AHG1yY_1733222062
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: SVKHXFaTeWk5

On 03/12/2024 10.21, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> Update the documentation when KVM is referred to.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   docs/bypass-iommu.txt            | 3 ++-
>   docs/nvdimm.txt                  | 2 +-
>   docs/specs/tpm.rst               | 2 +-
>   docs/system/arm/cpu-features.rst | 2 +-
>   docs/system/cpu-hotplug.rst      | 2 +-
>   docs/system/ppc/powernv.rst      | 2 +-
>   docs/system/ppc/pseries.rst      | 4 ++--
>   scripts/device-crash-test        | 2 +-
>   8 files changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

