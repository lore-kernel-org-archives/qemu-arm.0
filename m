Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp721652njc;
        Thu, 5 Jun 2025 23:10:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9BGsA74prtuk82gBuP2zwKsMTjEddIZWFTu5/unhYF5Mlljh7PpVRuls5j04KCvRAGxOGy6Si6BAtzw==@linaro.org
X-Google-Smtp-Source: AGHT+IE6N7QwBH5vuiCTuuZF+U6faRComtlpcSnz4hgg04GnqRB/hugHCehk1zn3oaawz0l+NV73
X-Received: by 2002:a05:622a:4d4f:b0:4a4:30e7:776 with SMTP id d75a77b69052e-4a5b9e1ff52mr37468171cf.14.1749190212412;
        Thu, 05 Jun 2025 23:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749190212; cv=none;
        d=google.com; s=arc-20240605;
        b=CKYZzLRKyCF9bMi3pYM6tx2G1B0cRrgiUhEJjClBItL9hAOLvuVm7aW9XAphoxmi42
         milXX7s7Z5YHnsVzFyiGSLaM7Z9Q+Xm9oZ/1Of1LFM15tPtrqtCOShm/jStW3pUjLnIk
         V+2cf+tmZum9P5VT02XGHWYE99pLSPp6AtNqWrRNj8+0O/xcWe/Glqkq9QSAZf9RdY4H
         dh1kUspTQVzYA4N7WPVUIRK67cfvhkqQ7ydSLWq2SUt6IHhQDbAHu4TSZ1p2UJf/Cnxk
         1APwhEtxBeHIIcD02chTLHMNeQUSbQhrUz6wk05oX7hV9YfR/CrsBsCsUApFppqz7eH2
         Gvbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cByiSStoffS6mXs4MY0CM6SaegGyJSJRDeB/IrgUMGc=;
        fh=gKF2qVr/W5ewrctc+2p/I9QMv5PmU8ewqmt7CriEJi0=;
        b=VpTCIJE/vDLbNvbyFXv9AaSeRG0K2b7NBek8MZEYl0MhK4ljq6Ql3b5Dner2wDVCfv
         owZCus2EFtc4CbZAbHdawWImbKsb++uMzAmqQIGHqFVA4ttUpc/gaM1+P/JaPn3U7886
         pJ13qamHmGQCBI7nfMLnYYa/Yhu+7/CsKSkRHwPuqAtB9yAUc97M+VV+BXtm79mgDI45
         KnmqHF4UYNSZIR0JAUGuddT7YTUPNSZhlVDGlRmPs4Xco+km06ue7NcS+iNBOl9ZbV/F
         VteBoNUGpstKhtpikaULQ0LYNuvd7qwVEPv708VP1PNBOJZf3nlWSs6EDtuGGoPN0r4j
         3M6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XCPJS7pv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6198cec9esi9566921cf.670.2025.06.05.23.10.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 23:10:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XCPJS7pv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNQGd-0007Kv-Ca; Fri, 06 Jun 2025 02:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNQGZ-0007HG-Se
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 02:09:24 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNQGX-00042p-Sd
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 02:09:23 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so14041245e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 23:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749190159; x=1749794959; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cByiSStoffS6mXs4MY0CM6SaegGyJSJRDeB/IrgUMGc=;
 b=XCPJS7pvwrfzEcOI5zOmWGeHepeJQfCkz9thbL3TOz28vUy/ZgEhmRNEprHoLzEz6z
 SoJBWuQQS1/58FlwjwPtxlYmBOJvQC/0cVYFrDn0wrHp/05L9MgE+evwDnSpaYI2ixGQ
 jAEpeqgzwsJ8CvW4hTXa4VYXkw/QCGEydj4mdpODQ+/K2LVUjCZCf9V+YCUZd8eikVqO
 sR7fe6ZnruBh7323TbdDlFmDDA3Rdv5TIwhZd/y8kW39TELtIAlTQXRBAhwrv5uXSAhx
 6rucZRRo38Fdw9GdCK6BIc20iRRlGr0d+8kkDhF7r5p1mNo0vxsALmXMSyqpS1ZPj4ir
 Trjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749190159; x=1749794959;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cByiSStoffS6mXs4MY0CM6SaegGyJSJRDeB/IrgUMGc=;
 b=fu+2qgvZ/lAZltDHHPPcrlS2uRchW2U+nwRA4mYx59/WxyvxOz7xzubT77fNvnL7sl
 pOr6vFBXzV6hYVKeb1Kauk8aw/5B5i+e1P3tz3q5AFgr+T69ZptLHc4emfnds7Po5WJ8
 jIFm0l40Tqzy7GLN6y+R7wl0D7T1fiHkFh0IJaq4Id9k45pS14ykLiCGsZQjC76BLcaP
 Dvc+31hWkOPqkBuqSIQROtCsGni/rMiOLFIorUh15KUQ4aAk8m1IswBs/o5l3aGPpuAG
 Srk+NjiUz0djKQVic71NqULw9FJlX4ZB2eVwmidGa4xEVKEIWU7wiL879C+yF5GvhCCk
 jGhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzUw713G1JLiYAhm9SqGIEZ/Ku84dslMJQOUx0BYTQezb89FmuwusCCy4kxWVlu/cO1lH7S895eA==@nongnu.org
X-Gm-Message-State: AOJu0YwcEp1e7a0LZb4G9lPGDNFI/QRTcWKxvBo3PSebOLFWzJ1CQmNu
 DCmjZP+msAuC0K8NV3yXPnNRaiLJn/Bq9r2NyhZ4GbFVQyrApfOOjXWEawe7SX0MVBE=
X-Gm-Gg: ASbGncvX2AKkzx07fzAjBD8ukDWhTPmk18MKQrtnwEQB9e+FAOnYSUXrLCZzYXP9PYS
 ezFr+unPRV5svJRayXLeh+cYVhnhm3KdZa72S6Z3Z2bqTD7adXuUdTBkeQoAX/88VBPK7oe0nVm
 L+KtuUoJbhvFQe+EjbKrmaTV2OQEN9KB2rAQh13q99RhJ2DS06LHXp9biJBIWiYIwR4VJJxPHwF
 E0PZZVSHR3vxLSHmI/K+M3nASTEvAX4+3s+oFfxjDSwQ6YDnm98XYL6lf2FRcmN9GNzo1B6eaIr
 KL6dDmeNatoSlp6mt/nLr56DPgA9ej9W3Oa6aZyukLxcYo7qkz0IgntWno7IODTOga0/Hjn4+iy
 DAW1T5nWqrJFjTc9qfmc=
X-Received: by 2002:a05:600c:1c99:b0:439:4b23:9e8e with SMTP id
 5b1f17b1804b1-452014ea237mr19528365e9.3.1749190159484; 
 Thu, 05 Jun 2025 23:09:19 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53229e0dcsm972282f8f.15.2025.06.05.23.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 23:09:18 -0700 (PDT)
Message-ID: <0f7673d9-31f4-495b-a118-f53ed6c6fc37@linaro.org>
Date: Fri, 6 Jun 2025 08:09:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tests/unit/test-char: Avoid using g_alloca()
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
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
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <7832d31a-2707-4cc4-9838-f2ea4b6b2cea@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lyCZn9+YOX6W

On 5/6/25 22:53, Pierrick Bouvier wrote:
> On 6/5/25 12:35 PM, Philippe Mathieu-Daudé wrote:
>> Do not use g_alloca(), simply allocate the CharBackend
>> structure on the stack.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/unit/test-char.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c
>> index 60a843b79d9..f30a39f61ff 100644
>> --- a/tests/unit/test-char.c
>> +++ b/tests/unit/test-char.c
>> @@ -993,7 +993,7 @@ static void char_udp_test_internal(Chardev 
>> *reuse_chr, int sock)
>>       struct sockaddr_in other;
>>       SocketIdleData d = { 0, };
>>       Chardev *chr;
>> -    CharBackend *be;
>> +    CharBackend stack_be, *be = &stack_be;
>>       socklen_t alen = sizeof(other);
>>       int ret;
>>       char buf[10];
>> @@ -1009,7 +1009,6 @@ static void char_udp_test_internal(Chardev 
>> *reuse_chr, int sock)
>>           chr = qemu_chr_new("client", tmp, NULL);
>>           g_assert_nonnull(chr);
>> -        be = g_alloca(sizeof(CharBackend));
>>           qemu_chr_fe_init(be, chr, &error_abort);
>>       }
> 
> Would that be more simple to declare the variable, and use &be in the 
> function code?

More context (see reuse_chr ladder):

-- >8 --
@@ -991,45 +991,44 @@ static int make_udp_socket(int *port)
  static void char_udp_test_internal(Chardev *reuse_chr, int sock)
  {
      struct sockaddr_in other;
      SocketIdleData d = { 0, };
      Chardev *chr;
-    CharBackend *be;
+    CharBackend stack_be, *be = &stack_be;
      socklen_t alen = sizeof(other);
      int ret;
      char buf[10];
      char *tmp = NULL;

      if (reuse_chr) {
          chr = reuse_chr;
          be = chr->be;
      } else {
          int port;
          sock = make_udp_socket(&port);
          tmp = g_strdup_printf("udp:127.0.0.1:%d", port);
          chr = qemu_chr_new("client", tmp, NULL);
          g_assert_nonnull(chr);

-        be = g_alloca(sizeof(CharBackend));
          qemu_chr_fe_init(be, chr, &error_abort);
      }
---
