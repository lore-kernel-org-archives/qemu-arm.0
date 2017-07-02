Received: by 10.25.227.6 with SMTP id a6csp483314lfh;
        Sat, 1 Jul 2017 18:17:21 -0700 (PDT)
X-Received: by 10.233.239.11 with SMTP id d11mr37009420qkg.126.1498958241216;
        Sat, 01 Jul 2017 18:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498958241; cv=none;
        d=google.com; s=arc-20160816;
        b=dvDXMP3HRLRgkUWhl+9/PBaCz0A1VBGcn5ZHinD+jkIMI2iFFGAp5x0yQGWSDaPXPH
         E/fMIHQVRIdnAGdlPjt9ykTzUAAhaj5G7rAzy/16CYlvU1QnXygzwMYvb0wFC+a76Rzi
         FJTvNeoLZoUSf2768BifpYDe1SN6RAqx6LzYOj+JzTcZuFpGtRphfM5RM4v4Otn9Bda/
         adr5YaFcKjfCQEt6r9VZOMpu0VKd7toXUpz68gqu/aroOHi5PTVlZuFQCwi+Er4HJgO1
         +WZFO6PTxfvZMxCdnn33zQ5jjNK21dR4VUFQkZLeFYHx82UK1EWiojxv5o3RmGvCtlus
         FRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=ST8c91mpqAJYt7Hs6aFgLUsVLdvqRpN2GM7eXrxejMM=;
        b=HWvpk+b+8M9DNTlqNiYFyjVAepdDLsDDNn2NcIURN8xO34wiRLunqLDjRAM16DGKrJ
         1NWiWAWtNB0F9rleC+/scrX06tVqfEbrQujsJh+a8hmeDNdxOJpH86j2MPHM6504iGTE
         k8Q39MCM1LSQC7R7uSKW/Yt7tPlXSijEeyZeu34D6JhUsJJSNREtd37JErL28lwmL4VN
         VDnjN0Fo3uIw139Vg/mNBXa/7jQX8aXUOP41CIwBDtj7/UNnzOrM8YnAlFIQnFJsT/tT
         6NFBikH/bV9HA9S9rdCqcyVTLh5uU5G4kBnm66itvzTdnAGzUBHKrgTubcz6Wrdf6HEa
         xJLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=qCC49P2a;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com. [2607:f8b0:400d:c0d::241])
        by mx.google.com with ESMTPS id t69si11165938qka.264.2017.07.01.18.17.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:17:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) client-ip=2607:f8b0:400d:c0d::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=qCC49P2a;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x241.google.com with SMTP id m54so17136550qtb.1;
        Sat, 01 Jul 2017 18:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ST8c91mpqAJYt7Hs6aFgLUsVLdvqRpN2GM7eXrxejMM=;
        b=qCC49P2anK+TfTKtnF5aeSz149bYO7KP/dOKnz8XMQIQqWXXTv4I1jsFjDcg96bwfQ
         +0vaXzzost+xJvP+xfG8b2TBXH/o26Mk764FEGUI44gFHwyFvODxI+yLp4w3WiZQ7UMZ
         iy4A6P3mf2ItpnEuODvn1ZwmSclLLJ0QicW0A7N7gKSpiDGgIRPKCbpjTbE0pxPMvaQQ
         M6bP+GR8JYDcuVUw3sj3b7QQk5GAs6W3n2yeAS5+IKaiXn1SA2UPd/5+Ge8hJtn7bmqV
         BElYuCoyRXxELieuZMu31JCTiwvHqPES0SDUDVzIe/oSPZvNv2tl8+K3eEgwZKMahk31
         e5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ST8c91mpqAJYt7Hs6aFgLUsVLdvqRpN2GM7eXrxejMM=;
        b=fUd94xCk9/oCeLoRWq9yzR/81fcDaoMS6hv8151blpoJPrD0754ObEyGG2lzRZ4Br2
         KSg9icWrFuDSkY3jXKj4vBMquLQXF0HSYU/tFTEAssqoOH84xdO4yoQE30ZZT1Djsiwd
         IrxZOiJw+FSLkYsO/blBA568cxKwblkBjWkE03KaqTV+dAoeLVNj7j9GEBackzWOEAbs
         YpzvbKZetMHqpLm5A5cpyLT/gTNkS3ca1EQNhLQcCIGS6ncjGL2yGGPhxar0fTEHN/22
         ZwLE99nA0/kP6v3W1bpMl/P7gCcZHKuceFTleh3en9rxnzveumXDsODqd1HD3IoD+QwV
         aFvQ==
X-Gm-Message-State: AKS2vOyFC0fwRdCs6zsfQFhzbAdm0LcSDxqjnj7flv6OVx2vSU7WU/1W
	F3zngL0REvO+eQEjgqo=
X-Received: by 10.237.34.196 with SMTP id q4mr27565350qtc.39.1498958240692;
        Sat, 01 Jul 2017 18:17:20 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id q52sm10325285qtb.56.2017.07.01.18.17.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:17:20 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 18/29] target/arm: [tcg] Port to tb_start
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865655643.17063.11835076868609448555.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <43b2a89e-c365-baaa-4748-505b645f459c@twiddle.net>
Date: Sat, 1 Jul 2017 18:17:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865655643.17063.11835076868609448555.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: JfsjmJZtNl0j

On 06/28/2017 06:29 AM, Lluís Vilanova wrote:
> Incrementally paves the way towards using the generic instruction translation
> loop.
> 
> Signed-off-by: Lluís Vilanova<vilanova@ac.upc.edu>
> ---
>   target/arm/translate.c |   82 ++++++++++++++++++++++++++----------------------
>   1 file changed, 44 insertions(+), 38 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
