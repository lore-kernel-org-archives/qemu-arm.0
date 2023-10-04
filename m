Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2653096ejb;
        Wed, 4 Oct 2023 06:27:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9GkFdMS2Xr+cwNBW/ymf/ldKyF7rYaJ6ctWqQS7mFfzFJkBpruzGtArsRuTLxRb7DUuZy
X-Received: by 2002:ac8:7d13:0:b0:418:1a5c:dcb0 with SMTP id g19-20020ac87d13000000b004181a5cdcb0mr2491326qtb.6.1696426038789;
        Wed, 04 Oct 2023 06:27:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696426038; cv=none;
        d=google.com; s=arc-20160816;
        b=eB5sHCJ8aX1J382ibyjngki/G0BjgCtNPv2E1ZBilIG3s6Wqv6aXMRRt87i9Kh4JE8
         xzBD7m/K+8zfnx6goTW/c4PvSIUmMgmjv5y709IGPxG7aYB+xZjF2zwKHeGLL6/gEuMd
         jGCO6GRLCz5TCwnSQetXkLDn15UFsY8k/sWl+wyKmC4RjE8O7co4nE2cwIkYRioIJtiU
         Qxxf87WPbVYOTAK2VC9C6OrQUbn/T7LE0gRcDdbEo15f1Lca81JJATgK8s7Ohrpmkmhu
         OD3kgpeSMCpluOi6h/c1tV2kZBFc4YQiqYi2lfMAs37qtRLH4b3rDxFSRe8RwyQgV06H
         1GAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UJXwDMO0kvLWg+nqsg5Zr2ChoY1CgIe/vOujBdEiq64=;
        fh=hYe3Q9Fa7QAdryYd29EMdtcD3ZpjTNGYs5LDfw6a/Xs=;
        b=vDe7nltkUv7yi5bN6QzPxhxEmHM/EmT3PxG8s+Jm6pnl7I09UOlxfAsiexK/ZJmJp+
         GkV0uXGqMZSIRySmVdbCpXR2R4USulZnbybA6GuZCBk98QDastVFYNtkH6qsNKsT2xVk
         UfbrhplXlQNfkmaccNAAn+lonAppdJ+ypGRJ04yj3GSgT8MmERaMmmqzeVvWA+SlXpnq
         To4jBjiiMM+jBy7YV1+dRrgdt4kc/4zUqlBE3WieaG/o3nGmXMbKkLY+euUoVACncANu
         P3qnfUEPPMHabPEujgzX7uW6mR/Qdg55/Jxsfnpcfk7WhWCc9cNo1ogOtFgyvTk2VSQu
         SyoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LfcWLh8E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020ac87c4f000000b00419898a756fsi1483092qtv.301.2023.10.04.06.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 06:27:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LfcWLh8E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo1tu-000854-R4; Wed, 04 Oct 2023 09:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qo1tt-00084K-At
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 09:26:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qo1tr-0007Hs-R0
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 09:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696426009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJXwDMO0kvLWg+nqsg5Zr2ChoY1CgIe/vOujBdEiq64=;
 b=LfcWLh8Et+kTJ3alVTIMgoiSSuXcBx2GMDOjuxhz1RHbjNVoNzjrX8LRcEC/UARdsBlEuk
 lTPvsQA6WpTKdvi22cIgTt0XSpKAEyREZ4bhsiKOv4mV0M+keyG5TfRXKsOLptHsyoTFO4
 ILJCuz5BGrVtv+XFrMijyMrgeYkmlAU=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-qfCp6Y4xNPGdh_uJsnHypQ-1; Wed, 04 Oct 2023 09:26:48 -0400
X-MC-Unique: qfCp6Y4xNPGdh_uJsnHypQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-d865a8a7819so2710335276.2
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 06:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696426008; x=1697030808;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UJXwDMO0kvLWg+nqsg5Zr2ChoY1CgIe/vOujBdEiq64=;
 b=hRVmdVyJtKG1SJo+F+iy+5bWU+aKVOtOJvnpz9LhuwgjIbHnck0ALSS5Pgj24u2kcq
 3WSW2vzqXh1RhYzGv9AhfA5DJFiYSChDd8nUpu9J5hzl9hujgC32Y+EROVZbzZYcntWQ
 bGrYn/9erPhMoqqmgmkyeHbAn4U6J1mcxQGI57ktdTBNXJPkALmgooYe+5i4mqFp6aP7
 SHfY1kezEVRqDR71tOvwuHvwjX7qZDoKWdOCAqz/kjoycnFjYT9L6FnR0gvpAVtQwtQF
 7GgPBOybIWFMujactBwVe5G8JxgOlvqrITUVPEMm4eCrVHQz+gNamy3e895Gvg2m511V
 scaA==
X-Gm-Message-State: AOJu0Yyn/M2VTawU6Tcx/KbWzV60VYv5fnFwkMi76ArqHfwojVMwpzEt
 ZeZ7Tk0GG+xAoZVUoawWs9MpBVr0NC5xKFzexr4tVxWieQkDKKI4tOv9ImZeu9cm1CGvf6Iq2wx
 UMM7jccuHeiLU
X-Received: by 2002:a25:d884:0:b0:d86:aafd:dcba with SMTP id
 p126-20020a25d884000000b00d86aafddcbamr2079108ybg.64.1696426007969; 
 Wed, 04 Oct 2023 06:26:47 -0700 (PDT)
X-Received: by 2002:a25:d884:0:b0:d86:aafd:dcba with SMTP id
 p126-20020a25d884000000b00d86aafddcbamr2079094ybg.64.1696426007719; 
 Wed, 04 Oct 2023 06:26:47 -0700 (PDT)
Received: from [10.33.192.181] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a0caad3000000b0065b13180892sm1339151qvb.16.2023.10.04.06.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 06:26:47 -0700 (PDT)
Message-ID: <89be6f1b-7658-82a2-b877-7b89733430e3@redhat.com>
Date: Wed, 4 Oct 2023 15:26:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 00/13] misc: Rename 'softmmu' -> 'system'
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20231004132017.160874-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20231004132017.160874-1-pbonzini@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.528, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 00KvCB9Vat4S

On 04/10/2023 15.20, Paolo Bonzini wrote:
> Queued, thanks.

Ok, but could you please wait with a pull request for a day or two to see 
whether we could agree on a better wording first:

 
https://lore.kernel.org/qemu-devel/85be2979-c0ca-3eb4-dae9-bbabf256c201@redhat.com/

?

  Thomas


