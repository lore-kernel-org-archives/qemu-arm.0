Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4304068lfg;
        Tue, 11 May 2021 12:53:17 -0700 (PDT)
X-Received: by 2002:aca:3ec6:: with SMTP id l189mr23151866oia.8.1620762797547;
        Tue, 11 May 2021 12:53:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620762797; cv=none;
        d=google.com; s=arc-20160816;
        b=SC3BRLufSi1dAMDpZCcH8BI5fQu7dtga9vjEsE6h0hhRhU6Wpa6WUrVVL3E5wjrW5x
         Rm7CfkN++YYafwvL3qKYRvTqVYz22XCydgBNWSAjVfRBIMtmbW25kU3Wx2+2bLArVcZn
         rGEC+zNlmo6i4blwGFhw50wB2feqRcSuwHVfqpyJR3APAnA2xK5FE3bzFqqN7ijBddaH
         f9NXELzKlQzxwa4imBWd/bL9kHIhsejXIMUMlyz8aVBw+x1t/U9lQmyFn+PkUAc8h2PL
         Ikk64PVwjnsyYzhLRcFVDT+zOnucLl9Y8hij0wFLb5W/iaw5oU9+zbXgxWb8+H7OepD9
         MBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=No9d8SHyefe5+pffPLk1H/yT7ajB5YpX5bZ6oy8CoKU=;
        b=zPROKXPqrGDaHIw5z6xMng/FSQrrP4rKEikiJ/6N2XdeB+v7+9hOfKLrQPb3304AAh
         YkncTkdyCOnJUsCL6YcziC+hm5nSuNCQPlX0+BkXswGO+8NLU9e7Lhzsd+3xkkGMx3Qr
         +xFCa7VyCu/uQ86EOR/Gyh8qtEtX1uR3CiHtuZ4mclUKU5HmFZKh56QwMvL4nC8XWeLq
         /3Zvj+Il4+uiHpuJiRKAfxUlGrA8/S6kwQfPJtrBh56DTroyErJCS2uqtoFPppomGyj6
         J44ytTDv0OwRJpdj3d8zJOa33Nt5ff38n5DDVzfQfYsPnwGHNWt08QP+GKaKr7ZGGJmF
         y68Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RECWgyl2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m62sor4670393oig.16.2021.05.11.12.53.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 May 2021 12:53:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RECWgyl2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=No9d8SHyefe5+pffPLk1H/yT7ajB5YpX5bZ6oy8CoKU=;
        b=RECWgyl2ys9WGu9r3Q9TJybueihJqYAlmZx9wdVAoyKuyGUJ/zdoXdLMex2tQi/XIj
         R3wqY88Ged38vr9XTrLMJwfAR0qEr1fvIsd3Z/Nj/ikt3Yfj9eaxrH83VuXUyOJ+gSW1
         pCQynxtAyyQ10vFl6vlVw7fAO/BHhpy5VI+OoxP1sOWNF3UI33gD4JEabz6HTTtVB9wP
         KMel2WXakTG367dHfkzgnY8XCWy84Ym83iJo4jpamAckcgJuh+l1lNiAxDLZ76mxkJdE
         by5CuwFpA1aUBM42xzZX7nJQs6CRWN30zvmERc6WiHOks/Kb+KsCUqxQbGLB3D0W+Fcn
         a/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=No9d8SHyefe5+pffPLk1H/yT7ajB5YpX5bZ6oy8CoKU=;
        b=JjwhyrL69JtZqcvQp3BsvX2qEPdjL+GI7Z2gLhjEhFP8TVUGhtAZvSwJLH+5UWv2zK
         RaB8h+hsnjSxYfF7E0Z3/fYcV/gPWjLn4WRM/z7rNjEOmczB8Cg9wV8TpuL65zsNfV/J
         w/pSDXXKu4Dk23RGqiX5yQXPKdW4Y78j1GU3vkhk2t5qvQ0UcobRiNNFWP9uuKsfffdu
         CQOvcqjBo4wD32n58ZQZtpqrmSiCI8N0zGrvI9pUeFfL2ksZN0hcfiJCtkiyIPxyewrL
         24AkQvKPljAtTngdshjox7vfYtUjJc5s/oyg6IEt8rcMRdzy0sBC7mEGv7GuKbXRtz40
         0qyQ==
X-Gm-Message-State: AOAM530laUHSs3aSUufrnWW+qX1WiM904X0XZlfr8p4PzW+eiRbPnydx
	JU5IXXptwn+vYyw+cbI8fy1vpcso
X-Google-Smtp-Source: ABdhPJypF7sW51+DKX2GBAagP+UMszsW6HvqfFQAH04ya//ISHHLQ26VIQcWdWjpiZjvbGEo1QcKCg==
X-Received: by 2002:aca:47ca:: with SMTP id u193mr4851641oia.69.1620762797193;
        Tue, 11 May 2021 12:53:17 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx. [189.204.200.163])
        by smtp.gmail.com with ESMTPSA id 68sm3954860otc.54.2021.05.11.12.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 12:53:16 -0700 (PDT)
Subject: Re: GICv3 for MTTCG
To: Andrey Shinkevich <andrey.shinkevich@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Chengen (William, FixNet)" <chengen@huawei.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "drjones@redhat.com" <drjones@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <1f157423cc544731beb743287a4be5cb@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e85f403-c6a6-d341-55c3-079bac85be2a@linaro.org>
Date: Tue, 11 May 2021 14:53:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1f157423cc544731beb743287a4be5cb@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: eOPrsaLpV3gI

On 5/11/21 12:51 PM, Andrey Shinkevich wrote:
> The version 3 of the Generic Interrupt Controller (GICv3) is not
> supported in QEMU for some reason unknown to me.

It is supported.  You have to enable it like so:

   -M virt,gic-version=3


r~
