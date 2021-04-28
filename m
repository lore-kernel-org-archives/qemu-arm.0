Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp790443lfb;
        Wed, 28 Apr 2021 09:39:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbESCFKtHX6FBH6IHWQ4wCG5CtR8NbNmKljwT/nWPDhbgvJt9+bmau5xLfgTsoaPEYdLF+
X-Received: by 2002:ac8:7547:: with SMTP id b7mr28655175qtr.176.1619627983251;
        Wed, 28 Apr 2021 09:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619627983; cv=none;
        d=google.com; s=arc-20160816;
        b=vYtHNLx8NuxSecup+I0H3FciqNsHHTySB8qJnoYB8s/1ih8HI3kNxEwXagsMgt7Mok
         AJYEs/pSN7PfGA0co6cwc7efDRkrLvj8SFRb3JlZ0XybvwOrF+vepE6mpfAE1w5YKBma
         BdPyQ8RPsdEzS0QDedx3CcHLSbSDW+u9PLuMk+PVTVeisxzs7fQIqQ86nT4Sugcw/XlW
         4d4botTmv0UWci+6jjk+/EuBTzDCJcGuaMNJ05gkMGUDN9ZlO828xSjBipU0rrN1XFvD
         67E2BnH63uxJov3Tisss2aUoZAbnPdLd2Ds6gbvyjrKYXD3Dwn1Fe6JraOJVV4wUerFg
         if/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NA69Tfjenpa3qNCZdSn29Xol1B12PCiFl1A9Zbz85l8=;
        b=EMj/Wu+a22ae72A8jrGonDnE5sM+5EQRlqEx9YFilPKOVRdBpKWSCdGxYPuhAnWfn+
         7FYIGXWRRMXV6De5O/KvOt6ZuCezooN8YnSewHv3x52x25m3DyeSu3ElKiwqxWlbjzbT
         mtI82BYw52RmhjBoMufk/VZR9ZiTY3lWG6eKChPls6FoATOZyegkf0/iWDqXviJCYGu3
         RslzOVpT78UKoPyD7erCFJz8ZbyzQMPFT20gXpxTWvS9Zpfb+U7NL7A1NEMPlFBjySR5
         DQx3eH5gLxS8k5FlACpQqmqzLsLx5KsB/ZpDDGGFqGVxgjVQjICAgHGy2M7QRcfkuUZu
         gfFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fG8mb0FO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dn4si159699qvb.222.2021.04.28.09.39.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Apr 2021 09:39:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fG8mb0FO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbnDy-0006Jt-Mh
	for alex.bennee@linaro.org; Wed, 28 Apr 2021 12:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbnDa-0006IH-Jz
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 12:39:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbnDZ-0002pS-08
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 12:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619627956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NA69Tfjenpa3qNCZdSn29Xol1B12PCiFl1A9Zbz85l8=;
 b=fG8mb0FOsBoxcFUs62GZVGaEFLJoqXoEUSu74o3sw2DDQyG5vwHhAVMhXDlnlv9QdUvU7E
 g/xLjy7JwrOuaJbKpR42AXUmA8O1r+LYH+OnSlmvj/WGDQGsSc+i0DDMtH9ZqheKmIXxzD
 jjeXVKgsLKToj2F3W9u01c78FMDU4Qg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-o9rKFs1NNk-eAuU_UpFgpw-1; Wed, 28 Apr 2021 12:39:13 -0400
X-MC-Unique: o9rKFs1NNk-eAuU_UpFgpw-1
Received: by mail-wr1-f70.google.com with SMTP id
 4-20020adf80040000b029010cab735fdeso4099462wrk.14
 for <qemu-arm@nongnu.org>; Wed, 28 Apr 2021 09:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NA69Tfjenpa3qNCZdSn29Xol1B12PCiFl1A9Zbz85l8=;
 b=BRg0g6WPqmTPxbWaBnGQf3nMcGZZawgMqx9ckr+Tbf9hsBYiSvv3YyuiqrbgzBuaHC
 dFKuEnb+0gXNZV9SulVKCY8D/IXh6GnkkWKD7wzinHkIKz23/E5RrRlEAUdSPZvmYtPC
 pIETUHwMj3TGgqvpC1IL97G09S8mGnaLEMZwk0aJpVd3hI9okj/3vKXHPRL1z/seG6gR
 1F+7u9MpnfRv++SMMNxMlnHN2R7zgq43Ns/T8YKhsqhhCMX7fBdv2nMWi/8NMzltlfJy
 40r8gQbtYdinB4a6i8Sw5aJFA2TSkVMLHLoWRO7fBheDVJzFHzqkWYlafRZ3NVkH4xSE
 Fjjg==
X-Gm-Message-State: AOAM532PaRJH8kjT5mriK6hI2B+lGKUNCUidVu0iFVZi/xh0dWqwZAUB
 qH9EsYcpwbsTLOzc+bPwwkCJ0SjSCvk3yAkISDveffSxaHh+gajuxoJBIGgtL6/IilS9mcZtpMR
 EIkAP8rC0yz3C
X-Received: by 2002:adf:e9c2:: with SMTP id l2mr1788905wrn.323.1619627951998; 
 Wed, 28 Apr 2021 09:39:11 -0700 (PDT)
X-Received: by 2002:adf:e9c2:: with SMTP id l2mr1788888wrn.323.1619627951823; 
 Wed, 28 Apr 2021 09:39:11 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j7sm233102wmi.21.2021.04.28.09.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 09:39:11 -0700 (PDT)
Subject: Re: [PATCH v4 10/12] qtest/qmp-cmd-test: Make test build-independent
 from accelerator
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-11-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f61bfda3-420c-5b3b-c507-6f034caad34a@redhat.com>
Date: Wed, 28 Apr 2021 18:39:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415163304.4120052-11-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8gVf8nVeq2Jd

Hi Thomas, Markus, do you mind reviewing this one please?

On 4/15/21 6:33 PM, Philippe Mathieu-Daudé wrote:
> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, do it once at the beginning
> and only register the tests we can run.
> We can then replace the #ifdef'ry by a runtime check.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/qmp-cmd-test.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> index c98b78d0339..8902d2f169f 100644
> --- a/tests/qtest/qmp-cmd-test.c
> +++ b/tests/qtest/qmp-cmd-test.c
> @@ -21,19 +21,24 @@ const char common_args[] = "-nodefaults -machine none";
>  
>  /* Query smoke tests */
>  
> +static bool tcg_accel_available;
> +
>  static int query_error_class(const char *cmd)
>  {
> -    static struct {
> +    static const struct {
>          const char *cmd;
>          int err_class;
> +        /*
> +         * Pointer to boolean.
> +         * If non-NULL and value is %true, the error class is skipped.
> +         */
> +        bool *skip_err_class;
>      } fails[] = {
>          /* Success depends on build configuration: */
>  #ifndef CONFIG_SPICE
>          { "query-spice", ERROR_CLASS_COMMAND_NOT_FOUND },
>  #endif
> -#ifndef CONFIG_TCG
> -        { "query-replay", ERROR_CLASS_COMMAND_NOT_FOUND },
> -#endif
> +        { "query-replay", ERROR_CLASS_COMMAND_NOT_FOUND, &tcg_accel_available },
>  #ifndef CONFIG_VNC
>          { "query-vnc", ERROR_CLASS_GENERIC_ERROR },
>          { "query-vnc-servers", ERROR_CLASS_GENERIC_ERROR },
> @@ -51,6 +56,9 @@ static int query_error_class(const char *cmd)
>      int i;
>  
>      for (i = 0; fails[i].cmd; i++) {
> +        if (fails[i].skip_err_class && *fails[i].skip_err_class) {
> +            continue;
> +        }
>          if (!strcmp(cmd, fails[i].cmd)) {
>              return fails[i].err_class;
>          }
> @@ -334,6 +342,8 @@ int main(int argc, char *argv[])
>      QmpSchema schema;
>      int ret;
>  
> +    tcg_accel_available = qtest_has_accel("tcg");
> +
>      g_test_init(&argc, &argv, NULL);
>  
>      qmp_schema_init(&schema);
> 

