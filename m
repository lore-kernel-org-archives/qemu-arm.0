Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5914650lfr;
        Wed, 14 Apr 2021 07:49:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZR/5PedVSwjJjr49+NSKwsJVt6Mz6XFCYQ+tvDJ1WytnlSEXQyzOM3I3TrPU8SnBtBvWM
X-Received: by 2002:a5d:8707:: with SMTP id u7mr30431030iom.18.1618411785519;
        Wed, 14 Apr 2021 07:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618411785; cv=none;
        d=google.com; s=arc-20160816;
        b=xpLx4lCSwKc80iR+He41ssgdJ3T3/XLPS61EWZ820svej9CukrrLQrhg/ha2uvoPU6
         +RtY+wuaR03lv60mRfDVmDowMbYxNZ7dVUxQSNQaKXMZtOmLFWYHJ+KIHwiNp9G3Oxoa
         crrETKox7IeGZhoSHicVRRniBPXfiJsYmWswi7mtLiJbb9HUhx6aguWPNf1Xrwep4Dg6
         dPRatZELYpLKMF9/Sp701gVq0oFak80CEyIM/si4oDsBVYMWbZDg5SWcy9uNeGRqYOr5
         XXio0Z5ea7PvAfHuMmwD+5XoZMWqH/YCJHxBE0eRc9VHKVQRkGJfCmDwP146PsCGSeLR
         EX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=/y6k2uPFWigLC7LYuqrZ2WQM+wb8ezGa1LptFPxTsbU=;
        b=BtG3fdNbEXyydyDkSxZZZaQOOgBfHfT7jpDoi5CzAUPmoXyEMnXTd9vSG5G4EsXHtl
         z2ZCEO4ychRgDiuuRG3ihWuSTlMefNPmteqb1h+3OlG0s7cLz4p23XvwNhcACdmnF1Ni
         PF3dTA9DO2SR3uvuRn+dRfA7Hag2pD3FyPX+ZWWLqgt5V8jC79UqbzDg2yphOhRRmlRG
         fThVzHUGZ5tqOu2PakgUD+khOWjGc1p4TkF55MvPjmoISCBjRr4g9rmhTnMCheqvQVkv
         XOjF/Rz8jZEbyDCT8tCyk8LxgghcoOvWfd0KS9iVl7JkH2u0icvvHluwtSLDB0hciYX3
         95VA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Wstn0g/i";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10si18250055ilu.91.2021.04.14.07.49.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Apr 2021 07:49:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Wstn0g/i";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWgps-0003Fs-Nm
	for alex.bennee@linaro.org; Wed, 14 Apr 2021 10:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWgoS-00024z-8p
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 10:48:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWgoO-00074B-IK
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 10:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618411688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/y6k2uPFWigLC7LYuqrZ2WQM+wb8ezGa1LptFPxTsbU=;
 b=Wstn0g/i6ozPlM4GRe/5m6/EOTCqDZzx0fVZfXwddg+AjqEJTvQAOCtWrJj0o/B3MHZBXL
 AsN8n/hUNPSrVK7RWdbBtw2uE7tl/GJD7/DgmEZt9ChJ7ABjg9IjQJwVtkSa2MkXiqZNIb
 VFnxSJHKdy96TydyeZc48BPbl4jrguY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-xA1yWXW2M6O5q1PlBzwxFw-1; Wed, 14 Apr 2021 10:48:07 -0400
X-MC-Unique: xA1yWXW2M6O5q1PlBzwxFw-1
Received: by mail-wm1-f71.google.com with SMTP id
 v65-20020a1cde440000b029012853a35ee7so2489338wmg.2
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 07:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/y6k2uPFWigLC7LYuqrZ2WQM+wb8ezGa1LptFPxTsbU=;
 b=U+UYExLx0I/OP6AlIsTjza2Dlc6nqZmz5z/LbOZQ3iC/Fl4VEqFOWytWMtDa1Y9ktd
 6A4nSDmSKYq9CXCmJ6C0TAKdy/U5/IRtLsHpNu72LYYgs1E4I4afW9dgvxWkBkcI2yG0
 UWwWeHrDF9OrFuCG0RGyoInPraM1Z1Pu6VZ0CXASlfYNzwFbJlbhcRlSYHMB+AlJeMGw
 rrFwLEWHPVxjjMsdJ0tSmHMuHn+3BUZ++XLM66RzbhwwCpxRfsmU7bonxp62hOcPyPg5
 3A+xHBdboopLC+crb0E1sc2qGd/B1DX4FvhTNTLGQOoZzCaZtP2pqtNVldgIRJiXl6zr
 /4fQ==
X-Gm-Message-State: AOAM531HMT76vlswALOqjT8YAWcb7cvlwZtbT2prpEf+Ob99QaMJtgGb
 CeHeEgH5C3CbX/ESWsgTONbjb9rXbrRk22zuJUE2SEqa0EOUzjrqPzUxA1AB6G56YOza5uKw4Ca
 5RtiXpp6xrFZW2AY=
X-Received: by 2002:a1c:1f92:: with SMTP id f140mr3323163wmf.108.1618411685975; 
 Wed, 14 Apr 2021 07:48:05 -0700 (PDT)
X-Received: by 2002:a1c:1f92:: with SMTP id f140mr3323143wmf.108.1618411685825; 
 Wed, 14 Apr 2021 07:48:05 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6470.dip0.t-ipconnect.de. [91.12.100.112])
 by smtp.gmail.com with ESMTPSA id h63sm5383997wmh.13.2021.04.14.07.48.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 07:48:05 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] accel/tcg: Assert that tb->size != 0 after
 translation
To: Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210414134112.25620-1-iii@linux.ibm.com>
 <20210414134112.25620-4-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d3d690a0-c322-5fbb-26ae-dcbf08173b0a@redhat.com>
Date: Wed, 14 Apr 2021 16:48:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414134112.25620-4-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GvXMK/297Ywg

On 14.04.21 15:41, Ilya Leoshkevich wrote:
> If arch-specific code generates a translation block of size 0,
> tb_gen_code() may generate a spurious exception. Add an assertion in
> order to catch such situations early.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   accel/tcg/translate-all.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index ba6ab09790..93b2dae112 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1913,6 +1913,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>   
>       tcg_ctx->cpu = env_cpu(env);
>       gen_intermediate_code(cpu, tb, max_insns);
> +    assert(tb->size != 0);
>       tcg_ctx->cpu = NULL;
>       max_insns = tb->icount;
>   
> 

Did you double-check the xtensa issue?

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

