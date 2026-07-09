Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D2EC43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 20:23:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whvGp-0001qR-TQ; Thu, 09 Jul 2026 16:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whvGo-0001qA-Mm
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 16:22:54 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whvGn-0007Kb-5d
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 16:22:54 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-84862b0d5aeso139067b3a.2
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 13:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783628571; x=1784233371; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=er2nd01K52fzoSCDKuPe6L+4tKyOrTAJPVN5CW28/d4=;
 b=jSYpQXQKWHL/vQK39bDSAYu/W/zP32QKBVs9KtTuJg9xH1KIo/jsyd/7QOyF0ldBQi
 Mj0nvQkvrC94kb1kv4n84IEhyIXFyQqWbRbPCWzoTSqTByF9UEOxl5/jskJiCRjmGTm6
 0nKQrdRSZ05nafXSvWAbY8XnJpt5BJCWQo90+w0T0qJB7po0PqUtN8NyMF6/7Ot1o+rg
 14mkwKcnavhJBdrUkI/fOBPpsm4McIOnxJZUyEecDeEOxywSwDCY/rzqHq90fYKWVWJ4
 ZbRqeygxHWm/Pwa+CIQQfnejYVL9MQGz2VYSUuylRtOW2kf/5nry5jXLX69EM2j9cv5g
 W1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783628571; x=1784233371;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=er2nd01K52fzoSCDKuPe6L+4tKyOrTAJPVN5CW28/d4=;
 b=bLacpPjAGUnGrbgZprZ8HMmqdf0aJEpjQVtCCW++TkkDfbJoDmIP/xYx+O2b0GfCfR
 jC6YcWYWTxu+DRK6kCSKlyg+e0A281sC0sOzlAQ44DfHiP6Frp5krXMPM1WBKxoacX8A
 iZ/o4j8tXnC16J9yaknajEUzgZmDkWLLKDpynfPBDQzlpJhCruJxg7Q6aVbGJoiC3VzF
 +0nzenSaZeLQpy7W5CN84+R/lSKVGvne7oY0W/RPjNIG7XamxX90ZWtm9A/3hcI7Gl3E
 3G+NwyHsHNUR6fak8VZc3TiH/zfviQDloa28W59AFklLVf4EKXWypBpldqTBZkK7BRC3
 cPug==
X-Forwarded-Encrypted: i=1;
 AHgh+RolmjeRLVoaaF5v9QnZJQNpptKXArg2rOWjXwUjCU4G23UFzcKgEr0lYfaR5oMGoBzH3YDhclFfcg==@nongnu.org
X-Gm-Message-State: AOJu0Ywmk9hfKCWlAvHJIy2DO60TXLOJWN9udhzvwqNxGFdRV5d1gttj
 RY3bMaEt/Uj7ZnorirWuQGU5vSnvBYoNVYC+aSzjvEoeq1gPlW1jO9pvRkmgOzkD2Q8=
X-Gm-Gg: AfdE7cnF0FswodYmYZo7QpgGChzIwAd1Dur97lV7GDPGSiKmjtc67s3fX4XlAlo8uvy
 OftCD+M5N4I5p9kFRM8SFle+CLXALODJAIR098aHHBq0+SWw/aLN6GPd6WWJbE7zggYddBMX5jD
 eIiRVVnCHBJ1blHyxY3fPNoHFnM25t2+5DswfN7tKAsy9nOfkLdVgUfinpDLKBx7Mr1yGogLZrM
 zJF7yZXpLopZTk+UV/v/yEMTt7aWcQw3kqf3mPUlJurm0nFyRT3VJ6Op1tPyuqmuNnktDi8Ytzx
 suW3+fydYWabQegXj/2s+FobB6FZeuRyRBCdzoQP4fU6MWPrqd7qYCKeMpiBYgOgseSEyx3/4Sl
 1FMagVIzqQaAZLzhamgqc3gbZ0CKsZtjbUDgoEMDRyhW6/sig10XpRGgKfBBCj/E3zt2hzOLa6c
 kjW+aMF5eumj4nOVa8
X-Received: by 2002:a05:6a00:91d6:b0:848:44ae:47c1 with SMTP id
 d2e1a72fcca58-84844ae87b9mr7146613b3a.78.1783628571139; 
 Thu, 09 Jul 2026 13:22:51 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2f15:8249:27c4:1b26])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d4dbdesm9126916b3a.31.2026.07.09.13.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 13:22:50 -0700 (PDT)
Date: Thu, 9 Jul 2026 14:22:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, jpb@kernel.org, lorenzo.pieralisi@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: Re: [RFC v1 03/25] target/arm: Add confidential guest support
Message-ID: <alADF-nLnPH53uWO@p14s>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
 <20260707224306.1202330-4-mathieu.poirier@linaro.org>
 <87bjcim6x1.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjcim6x1.fsf@pond.sub.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Jul 08, 2026 at 06:39:22AM +0200, Markus Armbruster wrote:
> Mathieu Poirier <mathieu.poirier@linaro.org> writes:
> 
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> >
> > Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
> > support the Arm Realm Management Extension (RME). It is instantiated by
> > passing on the command-line:
> >
> >   -M virt,confidential-guest-support=<id>
> >   -object rme-guest,id=<id>[,options...]
> >
> > This is only the skeleton. Support will be added in following patches.
> 
> Which of the patches add options?

Good catch - options have been removed because they are not supported on the V14
kernel.

> 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 

