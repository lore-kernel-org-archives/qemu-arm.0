Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp1038516njc;
        Fri, 6 Jun 2025 09:19:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSHKyjQaNAoa9G0C0PimEXgLV8/Km7GhAQAh2/mBnqKwgVMubJVUoS1NHZ1A/OYnfJKFewdj2A3wwWzw==@linaro.org
X-Google-Smtp-Source: AGHT+IGcez4BNc1rgwdaXFeWAlXtPaHLdTMMvUjtw21QR2kImOzZgwlUSaWBMJawRNbgvN9FRvx+
X-Received: by 2002:a05:622a:a044:b0:4a2:719b:1231 with SMTP id d75a77b69052e-4a5b9d96135mr48417371cf.35.1749226761109;
        Fri, 06 Jun 2025 09:19:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749226761; cv=none;
        d=google.com; s=arc-20240605;
        b=JQ9R5YB11FNbgA2Uw3GV4es1JIwS+Pq+rMfmPQnXnSkmaCM9Qs0NuQ1KDLtMC6enCT
         DthNqyg8mQD+8sxVFmRr4pXhR/sETu2tP2GmnEghQ9+xY2jMDIclBHwWiw7zCJrjPY6u
         BUYg3ZQ3bWJQN/eLfu7eaBF13YzATJY2Zcf00hK+B76RSZ1rmyTm6mArLyIDp5iLpLEA
         fJJE6/I8lcAnmr5jFR9ag8fo482yf8LsVX08lZip/vQcfGJyv3q81Qh7ZnO3WnXR/Zzo
         Gxk4LdFzOwjWskQJVgNkOvOQBBe5CHRLCCOJuM0zVwIsjd6pLCfTak7ajDrMcMvWIPb8
         pVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7b7GfhmSNpYAm204tVlseTvlPS7fdpMp975RzEXDCtM=;
        fh=TEsh7rbp4Rz08c5t+jXTWkpbrJazK+gR1rZYl814MpY=;
        b=RE7iaOHLDLdk6mSESsz0EQj4N4Ur4V33I9xUFL+djTwF4x9YEoKYZQviNa7xNBRoRV
         Geg4qeE8IhLZ4YxQwpPddyPNF8MLIFyn1sS8GlMMclQlqJPVTZYZYsUrSKAd6HO8S1u8
         gQvUd5KKs775sIbMXFQKCEMuWzDeWlmAiEQgMRRCODM95BmKfF7TjQr4twV/OXkkMYGb
         +rbF0VwumLALYu2QdPNSGuXI4oiOTg1otk5SfAzh/cSQcK65hbWaDGKbiQtuFv2RBgkR
         OxSm46loRG0eQvltunrsovtJqN+wan4yNXWGeCPpjQtXRuesFbEW+8PK1OVn0TZFSzfY
         7c0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PfUr/w/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6198a3bd6si20693491cf.436.2025.06.06.09.19.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jun 2025 09:19:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PfUr/w/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNZmH-0004hJ-JF; Fri, 06 Jun 2025 12:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uNZmC-0004gQ-JH
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 12:18:42 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uNZm9-0007pG-TL
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 12:18:40 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-747c2cc3419so1726046b3a.2
 for <qemu-arm@nongnu.org>; Fri, 06 Jun 2025 09:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749226716; x=1749831516; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7b7GfhmSNpYAm204tVlseTvlPS7fdpMp975RzEXDCtM=;
 b=PfUr/w/DZ5E0+buWLiTog0Wc4us8s5U9k/LgnBlE4g14JBPAr+RQA2uvLwI/Ho0TiJ
 Iu8tsUOKx0TMf4Fb3LK71nkIpnsNcBiRzvSVtBskI5zdIj6R5sAd5OnklXqxxs5PSy5y
 2fveqqE/60swOxZ4sle4R7yrVgPuH9RGKec5neIL0AH0dflltJobgU1PoOTyHa+iAhw9
 9Lthh2iNOIdYVGo1PbfzSiiyiA1k77ikl8t+oYlG9tLD7+iCRJVG0Q7C9JBbBjs7hX7y
 PGVyeAM/ZnYQpeyGaCkzweghOnxMOac1JtWLzPtVw55oga491XEfU+WWUchjfqwxBUdt
 YzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749226716; x=1749831516;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7b7GfhmSNpYAm204tVlseTvlPS7fdpMp975RzEXDCtM=;
 b=tg18LRDzDhMtbSzsRYgCTlIaVSVqtfoSIDrQdpuUgmkk+Xz6r4ME7+JL03xK+3LMem
 DSaXnE+Aow3wNgnhqdCfT+oXpSYwXttH+yhtBBq4wlMkVGVOenpy0OUzA0IYDWBzTgMs
 Y+N9EsIjQ4FXRezcXe7NaFgN017BlrNj9rGhSjtRTKC3kaj9kTsQINE1Hzx3J4Ib+mbK
 9WLW4+FjNLLv3X7lK6aGTgiHWBtCan590rvzeso8wsFxGmAcrefwyBYngdxME3E+d/dV
 Ok+MA6g3AouanG7+PK9PEHAfenuCcmh6n/zQXpghMsCnRQ87MoLMoXZjOjMDThf3LZiM
 5Myw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL7StnkecVrerWJmKEbpnbGHjhDNxA+xmjThIqLscFvP2/s/8o5lAIUAgPOpe0dr2a08dUq8nOdg==@nongnu.org
X-Gm-Message-State: AOJu0YyMRHqhGIn3UQvnhRjwgDfXGl/fqotlDvQWD2H9GObhG93v+Fn7
 D2uKVrNV+JiP5ngs0natBxtngRXcH7tsKCA7bZvOd1RYYG59vb831DJZQ+h7wyIvtAk=
X-Gm-Gg: ASbGncuW7IQP80bM+0zPWq3JEdNpImILevI+Xf2EFNOVt3xgjOr1sOx4aPKcFA8OMbD
 EW9sLFQ1K0naoV0+Toel0LXYAxVS6Ob9A/lDDIGL4TkFRm629eYZIR5eTP46/f+v80xFB0Va11z
 PelCn1Wxb1YkWINViWQ2276uQsN0Tz8YWuBgDRq4T8eZAPYKfd3kkwkzx37CzL+M/uLuH/i6K9T
 PhsCMaLr62539Rvuw8TiXYIqV/KmV7WFgQX1EKrzGtd9vGEaI+/ssfzfAHh7DN4/6H0ZrbK7QkN
 nA+VAKntqw/JiydhGWK7CrOfAG9hTxzMbTurykTr+4f8ucvLo6+nOBWPM38dvtlF
X-Received: by 2002:a05:6a00:244f:b0:740:596e:1489 with SMTP id
 d2e1a72fcca58-74827f3d35emr5636940b3a.23.1749226715869; 
 Fri, 06 Jun 2025 09:18:35 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0e9c3csm1447469b3a.153.2025.06.06.09.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 09:18:35 -0700 (PDT)
Message-ID: <811aa1ec-352d-40cb-a42b-2bca5dcf64cd@linaro.org>
Date: Fri, 6 Jun 2025 09:18:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tests/unit/test-char: Avoid using g_alloca()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250605193540.59874-1-philmd@linaro.org>
 <20250605193540.59874-4-philmd@linaro.org>
 <7832d31a-2707-4cc4-9838-f2ea4b6b2cea@linaro.org>
 <0f7673d9-31f4-495b-a118-f53ed6c6fc37@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <0f7673d9-31f4-495b-a118-f53ed6c6fc37@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 7vPlKv5gz2A/

On 6/5/25 11:09 PM, Philippe Mathieu-Daudé wrote:
> On 5/6/25 22:53, Pierrick Bouvier wrote:
>> On 6/5/25 12:35 PM, Philippe Mathieu-Daudé wrote:
>>> Do not use g_alloca(), simply allocate the CharBackend
>>> structure on the stack.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>    tests/unit/test-char.c | 3 +--
>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c
>>> index 60a843b79d9..f30a39f61ff 100644
>>> --- a/tests/unit/test-char.c
>>> +++ b/tests/unit/test-char.c
>>> @@ -993,7 +993,7 @@ static void char_udp_test_internal(Chardev
>>> *reuse_chr, int sock)
>>>        struct sockaddr_in other;
>>>        SocketIdleData d = { 0, };
>>>        Chardev *chr;
>>> -    CharBackend *be;
>>> +    CharBackend stack_be, *be = &stack_be;
>>>        socklen_t alen = sizeof(other);
>>>        int ret;
>>>        char buf[10];
>>> @@ -1009,7 +1009,6 @@ static void char_udp_test_internal(Chardev
>>> *reuse_chr, int sock)
>>>            chr = qemu_chr_new("client", tmp, NULL);
>>>            g_assert_nonnull(chr);
>>> -        be = g_alloca(sizeof(CharBackend));
>>>            qemu_chr_fe_init(be, chr, &error_abort);
>>>        }
>>
>> Would that be more simple to declare the variable, and use &be in the
>> function code?
> 
> More context (see reuse_chr ladder):
> 
> -- >8 --
> @@ -991,45 +991,44 @@ static int make_udp_socket(int *port)
>    static void char_udp_test_internal(Chardev *reuse_chr, int sock)
>    {
>        struct sockaddr_in other;
>        SocketIdleData d = { 0, };
>        Chardev *chr;
> -    CharBackend *be;
> +    CharBackend stack_be, *be = &stack_be;
>        socklen_t alen = sizeof(other);
>        int ret;
>        char buf[10];
>        char *tmp = NULL;
> 
>        if (reuse_chr) {
>            chr = reuse_chr;
>            be = chr->be;
>        } else {
>            int port;
>            sock = make_udp_socket(&port);
>            tmp = g_strdup_printf("udp:127.0.0.1:%d", port);
>            chr = qemu_chr_new("client", tmp, NULL);
>            g_assert_nonnull(chr);
> 
> -        be = g_alloca(sizeof(CharBackend));
>            qemu_chr_fe_init(be, chr, &error_abort);
>        }
> ---

Ok!
