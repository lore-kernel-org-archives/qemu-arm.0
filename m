Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1554037lfg;
        Fri, 12 Mar 2021 12:10:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzd7OvTXa2M1H8mo8dSkJZM3NlXO3B1doRbzQFsTxDpfzhXNAqPYbhGFiMV/pS0XIFtGj2Z
X-Received: by 2002:a92:4103:: with SMTP id o3mr950135ila.252.1615579810819;
        Fri, 12 Mar 2021 12:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615579810; cv=none;
        d=google.com; s=arc-20160816;
        b=Sb6GYMAkqyfP2UcEJ0pV8i1NKN8dXbmUP/OxraZniKHbn1o6CZ6iOJhXbx2G1C5Kje
         JXZu39Ao2xTYK+1UF+5KyAusoWILHvyBAsB83V1SR/QKjCIeX+wpUTvuB5AVzziJcZdL
         Z3CWTlyzaZ2a+45bCixwHBf5j+Q0PoXkNP7kkyQlhbD3eNlgbs8XBstXR6QEUs2VCHmz
         6cGtO+AKla4tAbqKzCFskMGZ+40AWpUQT28mi6OoYJP/xHh/xKtlXq5h787uRBfEzebP
         MB9fam+7ZI5WsXgEplJZzgA/01Vl+zFFH2+ZxjfpJDZ4dHPLBWE3hwQJo3SdtE/gnU6f
         lupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=S6UhTXUZeHjCGSW7IN9vyAan2ZLwa4c3ZUPieDtdYME=;
        b=E/tsVTQf8C4E54uN3rSD5fMD++2O15K2pjJA1rgK5t/Qq1YYwvF6U16kLV53HXu+NH
         yBihTaCk90k1BA0dzNFWiSZRQpgT82oBroQDFG873ZvVOAde+GWf6kCGzDkXxUs/IRhr
         qaSg06VHKp40Qs/Ojo7hD+uI6h7K3rNuRzGCIZfLrlw04s7WkjAobzzaafSy4jcKHY0x
         dFds48j1CNcglGWovcDsb1Cx0EengodOWfADSjxmjWFdL6XE+jxrf+qPbkY+Jw/ynUxl
         InFTt2ao6MDs4Iq4JVfCySYvIVpI0JhoRPbnt3jJsUFDXewsTDZsQk7UiUeWMua4O8Bv
         eWcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ub5s7Su4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si6480428ilm.112.2021.03.12.12.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 12:10:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ub5s7Su4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKo6s-0002nS-3E
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 15:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKo6D-0002Fl-6L; Fri, 12 Mar 2021 15:09:29 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:56209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKo6B-0006SN-Si; Fri, 12 Mar 2021 15:09:28 -0500
Received: by mail-wm1-x32c.google.com with SMTP id o26so4513953wmc.5;
 Fri, 12 Mar 2021 12:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S6UhTXUZeHjCGSW7IN9vyAan2ZLwa4c3ZUPieDtdYME=;
 b=ub5s7Su4r/4xI6RPQKAA1zVfEdj0zA1FRn5HUx204QIgPR6BjjX7EMTKA1IYvK4a9D
 tbvMzjNkEzC4A4JIJndgOdsvdj/hB2m6lB88EtfG5lxqDn2BVF8AJ6MFxtmykl/gcbad
 jgp+kQUKkLb6A0MBP+LhlQNs6MWfWAHI6ElEGGZZPC5iFUyVo8Dr2vSbpvtEfmDQq2rS
 ORhR7p3WfyvwuMVRNQrgg9r2UIcXiNS0Emhws8o48CneZe3jc+9Hhx4q4wVwPgvagAzq
 Uc9+IA1dMiThJIA+rLLlzBOJn4dE2B+Uhdg7WqEogetmCYUV8TuRxGTOpvrs7vUh7wuE
 QS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S6UhTXUZeHjCGSW7IN9vyAan2ZLwa4c3ZUPieDtdYME=;
 b=WbKPTQ+S7dzPhB3W0YAhdwGkTFqQZ/4fKUC/2UMQopFa9VtiKcvgxwrGteyeZsrElo
 xGz8/dBhXIXfp3yZBWJAx+j4t6I6KUE8pagKJXEhsOjraAuCThBtHP+wbV57/vjGmdyt
 41vb+shDET9QOZff4QJz7MSDtUt4TLWbKBLfmpPmAf73r8j2GpkDl3Dy+WAIaMK4cTMz
 OLoILQSZFzqH2uwlhThow6S0UPm0l9kFmcSGICRIDnqZk8WiXB28E5TG1LIIZHWoDQxa
 lacQNi2DNKt85y4fSHAOoYmo6DgjjwMVaQCuAIbyDwiJ3AbpJDAkm8GuuTmllyOF40nO
 rGpQ==
X-Gm-Message-State: AOAM533GmVDc1e1SWysSCkEuf5j2f0OVeX8lnNUHB7haOsfgk00qyga5
 xQ1RGPmy/c4TCEIWrsbB4vU=
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr14609189wmj.104.1615579766268; 
 Fri, 12 Mar 2021 12:09:26 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id r10sm3857336wmh.45.2021.03.12.12.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 12:09:25 -0800 (PST)
Subject: Re: [PATCH for-6.0 1/2] memory: Add offset_in_region to flatview_cb
 arguments
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210312172939.695-1-peter.maydell@linaro.org>
 <20210312172939.695-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4d6d72b5-e2e2-6879-490e-4bdecf8122a1@amsat.org>
Date: Fri, 12 Mar 2021 21:09:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312172939.695-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kumar Gala <kumar.gala@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Y7Jmoq9MRiv

On 3/12/21 6:29 PM, Peter Maydell wrote:
> The function flatview_for_each_range() calls a callback for each
> range in a FlatView.  Currently the callback gets the start and
> length of the range and the MemoryRegion involved, but not the offset
> within the MemoryRegion.  Add this to the callback's arguments; we're
> going to want it for a new use in the next commit.
> 
> While we're editing the flatview_cb typedef, add names for the
> arguments that were missing names.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/memory.h           | 4 +++-
>  softmmu/memory.c                | 3 ++-
>  tests/qtest/fuzz/generic_fuzz.c | 4 +++-
>  3 files changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
