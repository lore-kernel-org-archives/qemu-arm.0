Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3591580ejy;
        Wed, 5 Jul 2023 06:53:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEVRca284gNb2bPlULIgw2hsIHar3zZUi788x6Ka/0B3aJUSBdnWjiD9NOAmMFZqmuE1WR3
X-Received: by 2002:a25:6409:0:b0:c1a:5904:fe8e with SMTP id y9-20020a256409000000b00c1a5904fe8emr12987065ybb.34.1688565195588;
        Wed, 05 Jul 2023 06:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688565195; cv=none;
        d=google.com; s=arc-20160816;
        b=GuAM5bnrR3H5sk9SaAGvUrWKZW2NACviHrk+gbGass0ax2EjgkZe6JxkaqH5rlebK+
         0SZKN9kVt6E/vzRqSL1/FZg7pLtdlVe4/DiKQn+F7JEUya1DaM43kTH2RdYSrI/5UmXZ
         hSiB7Sse/z+BQ2jsS0crbLvJaZwfIwjTj+Myqt5PbDCrhIJS77NZ3z6slKil1c+4kmhq
         ej5+rGPnTjXkCZWvpnh1EoEelTlZKZiipEFCNQbBPzss1n1rGp1c2lGQNLagVMIBp6PA
         ZgySdq8icyqgenTvN47Ye/jqHsSvrqzUcTyWcJeMVvdY0ulJPqjLaUVqSxTL/7vofZgn
         jiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=0uRkTN8qg60w9UdsxDymsO/5BE5XssZaL7cz8WBLbdw=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=dBefgbHw1Fnef6NdFOrwmfhpwauaZ3JtIMQwxuXDyLdp2Pn0cP45Ywa58Zj2BQpfGs
         I76DBHxR/Um77Hm4iO7bQUypuTEwPZyEWgbPs+xbzMvrmT7tDIwDxKvV1aK/5IeSlqZS
         EM0wNfnbJlyc3p73KMdV6rqwMNP14rHkl7ZHfigod4/qEta9ZsTYFOqCnyJv+nsUdiis
         3yDaD+xvD0hw5TByqNmAOgL6EqUhbmwHEOHBim6bQFKmT47KyErIDgZT1oRr7el4emFO
         neHkFCDtVq6P+SfH6T8EDWLROn//MZh1Dws2P4iOBZIolUsn/xorUvfsRsfCp1isXzZq
         I+4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BY0C52nr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020a0562140ccc00b00635e3780df0si13299800qvx.465.2023.07.05.06.53.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 06:53:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BY0C52nr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH2wO-0004iw-Bh; Wed, 05 Jul 2023 09:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH2wM-0004iI-Eu
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 09:53:06 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH2wK-0006yz-MH
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 09:53:06 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fb77f21c63so10481669e87.2
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 06:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688565183; x=1691157183;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0uRkTN8qg60w9UdsxDymsO/5BE5XssZaL7cz8WBLbdw=;
 b=BY0C52nrag/qS+TY6mU7mwKuohgzg8/9MO50hpHXL73jH9+QIyrMkxj5sAQPA2Pt6K
 5q5TCHqN9J9YKp3GvRUYX29XRwzdXxIc69zxkdVTTDMcrFQu6JsCjNIXa2apuKEPeIju
 S+HQtF77U8pPJkWctSybg20mjdrzQY6W5JEk0IreqY7HNYqDxNZ3JCRLL2dupGARIqgn
 wSLHMjDkztzVAkrHJRsnMDcaP3ShGcQ5vByMgkbjeSmEoIfCupxviZ8tdrGuS7SYx+bl
 yYkGfbBXTaDZPytI6w93ImkMkKoB6z1Lq9e4gdtcSMRZFlF6J6zkJbpOKilqe/7gLCgn
 7Q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688565183; x=1691157183;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0uRkTN8qg60w9UdsxDymsO/5BE5XssZaL7cz8WBLbdw=;
 b=fYXpaC95oKu7EbrdFd3NUdDTZ6wqY0+QR9D9H9ZPahR4EJ1bHMJulStNjLVT5QIRMe
 yeUZIqnuOcl2oMMaRMJgSavkhPz67chwSrIjJ5zPu6NLM01Ppx6vAmY+0Xr80tfUfJ6r
 7iNR4l6HFEHYb4hpqC/zYWRISFj85nA8nmZ+byDL7NGeU6czzx6OcCX0BBTjVihhTJJw
 tkbyFm3axYW45ILh1Cw1kM44kjZjGwk826Ya3r697aYO7ti+CnVTXMqJouS97Ks5LMti
 xI3hhK09j25IcJQuBjgs6OydHYrk2/1BKXdjrNcwcGVwsk/5/AtKsEIDt7Z1QrD8uV+d
 L4yQ==
X-Gm-Message-State: ABy/qLaLGV2XXP4tPZREd3hmlAKGdzUUF9F/366T7Fy9LV4ekuVch+5X
 mMneUA7vQ3ktonqJUncrljPkmZnRbBFu/yWasyM/cw==
X-Received: by 2002:a2e:3a0f:0:b0:2b6:decf:5cbf with SMTP id
 h15-20020a2e3a0f000000b002b6decf5cbfmr7845605lja.32.1688565182744; 
 Wed, 05 Jul 2023 06:53:02 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002b6ee0ff9bbsm1345969ljh.67.2023.07.05.06.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 06:53:02 -0700 (PDT)
Message-ID: <52969943-de97-2d71-5321-175ee83cf73d@linaro.org>
Date: Wed, 5 Jul 2023 15:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] target/arm: Suppress more TCG unimplemented features
 in ID registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230704130647.2842917-1-peter.maydell@linaro.org>
 <20230704130647.2842917-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704130647.2842917-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: RxBjO+Ql0bUy

On 7/4/23 15:06, Peter Maydell wrote:
> We already squash the ID register field for FEAT_SPE (the Statistical
> Profiling Extension) because TCG does not implement it and if we
> advertise it to the guest the guest will crash trying to look at
> non-existent system registers.  Do the same for some other features
> which a real hardware Neoverse-V1 implements but which TCG doesn't:
>   * FEAT_TRF (Self-hosted Trace Extension)
>   * Trace Macrocell system register access
>   * Memory mapped trace
>   * FEAT_AMU (Activity Monitors Extension)
>   * FEAT_MPAM (Memory Partitioning and Monitoring Extension)
>   * FEAT_NV (Nested Virtualization)
> 
> Most of these, like FEAT_SPE, are "introspection/trace" type features
> which QEMU is unlikely to ever implement.  The odd-one-out here is
> FEAT_NV -- we could implement that and at some point we probably
> will.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c | 33 +++++++++++++++++++++++++++++----
>   1 file changed, 29 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
