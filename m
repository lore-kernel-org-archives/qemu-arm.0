Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3487633lfa;
        Mon, 7 Jun 2021 06:22:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUYmGu5M/ie4yXY+vzD/FGA4p/VXCD9vssKbvADnVpyR7US7Cvr55FVoWDEoQ8f/6tfcvt
X-Received: by 2002:aa7:d8d9:: with SMTP id k25mr19767117eds.377.1623072125743;
        Mon, 07 Jun 2021 06:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623072125; cv=none;
        d=google.com; s=arc-20160816;
        b=ckFEdAMQKHKFvIkASxp+qXANtXDrb75g3cHM8i6Gyn10RiC4bTsWdA4JqGIWACR91o
         I7S5XYFpnKH2M7r0VX7VLmodGjaKP8OpVZDFWwoIKMxsG/a2Zh8+tPd9+M2aYc8iB/eM
         vG2NPkZ4Tt0iUw+4W5BhRXlP2p7uGArhYBjb/EmFyN8ap1ae4DMQHXcLHH42P9gOS7Jo
         mc9zXVuuuwGbAwROgDnqcbx9mk2Npkyz/3lhd7XvSLJg0duW3HNKv8Gup2/iP7hWxIuH
         c1FvNBaQ61T7/0+XVkU+r8LENg3LbmoLeh3EjBCGgiZc0zTI9jknznftlzy2G92cm1uS
         GxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ligBG8t7toEqlQ4LBakBBJBXAcIpfWM9FfVkfI+tJYQ=;
        b=wcDpFAOmT67LAmFDGiCedoh6kDvBdg0HsbKdRUQkDvh6VFWBAGmqjpsnPuIbaAk3Gk
         U1YavJK/UjnFN4jcXb45WDJQUPoxfA23QruoAk+S2/dGpYl4E6Zs8HoVrLoAepg/aARZ
         H8G6eTEWmHLeFTop9OpvRdz4gOlCmMrGwvI/b4oOLLBQ9p6bU21w12pECR5CEm7PnofT
         kZ+7sf4JxrIObnQoCnY3DZ7nG81dOC1J4CINA1zFrdVEMYQSvVXP3MIKWAqFC5BBEVjo
         QY5e3KRIHJ9SULSOZkvxftf5CZF2MLU8PXkwRFv4gEPZmPBoh/49PEXu7Vez+NcC5GgT
         G9WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G+uLkZrV;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id v13si13022675ejk.187.2021.06.07.06.22.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:22:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G+uLkZrV;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623072124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ligBG8t7toEqlQ4LBakBBJBXAcIpfWM9FfVkfI+tJYQ=;
	b=G+uLkZrVhLDKU9PX6Y59q3zr2OB15yZG68g8NuPHyutWAPZDlPxrw37Np9EGshNsDGQOp4
	rwfEXGkYmqN4MwPO+7ZFaPZ2WfJz6yZKCP4tDYvuFWDD/oxmpfZYAU2V59cRiNIsrvjgsG
	fryDMnATF+HadiUWmL57S9NPSiv1X4c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-21KpknUiOTKi_AWLUv-Y5w-1; Mon, 07 Jun 2021 09:22:03 -0400
X-MC-Unique: 21KpknUiOTKi_AWLUv-Y5w-1
Received: by mail-wr1-f70.google.com with SMTP id z13-20020adfec8d0000b0290114cc6b21c4so7801660wrn.22
        for <alex.bennee@linaro.org>; Mon, 07 Jun 2021 06:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ligBG8t7toEqlQ4LBakBBJBXAcIpfWM9FfVkfI+tJYQ=;
        b=HT+LkRdGnT0IgicfdyNf7uCGTyqfv5rOgvTjESYXisQWrbjUXrWZLwSGFuiNQ+qhj5
         8gUeZtyFIy1QE3GiyWdU43wh7McNQphqSCcA1uyKXftHsIoXDVdXPCjPeFSYoMHdcdFJ
         8aUOowG+Juje7n5j7fGzqkuF39Lu9pmzKdLscBP9tEUO4kss67BmkkyUn09tvczgHFdo
         gvKgHCC8+u91tbB5FSdspp7tYPgxeJ/BRVeMyRnIKqV4JWAVzCy3QUcR7RTr6BFMmD00
         SLKJbCI39DNqA9I4H9jBon1ryAP3M7BVD0yQl0wyCaRkU1VBILhWxlm17BMKdbpjJLJO
         PXbA==
X-Gm-Message-State: AOAM532PQAaiMsr0MOfTGCy0twg8Vgzv3PoABLLeVVBZPzM31I5NnND/
	mntU3PfGztuV0wFPK7u/jQrS6VQ+K8EBAFgFgQJxWyDaNesbcyN3Wtp62oJo4BqJVAS4QZBYs/O
	fSKSifc//5dnC/97R
X-Received: by 2002:adf:fa48:: with SMTP id y8mr11350856wrr.387.1623072122546;
        Mon, 07 Jun 2021 06:22:02 -0700 (PDT)
X-Received: by 2002:adf:fa48:: with SMTP id y8mr11350848wrr.387.1623072122415;
        Mon, 07 Jun 2021 06:22:02 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd957536e.dip0.t-ipconnect.de. [217.87.83.110])
        by smtp.gmail.com with ESMTPSA id p6sm16412674wrf.51.2021.06.07.06.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:22:01 -0700 (PDT)
Subject: Re: [PATCH v16 04/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
Cc: qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d5162188-bea4-24ed-189b-198f9d3ed55d@redhat.com>
Date: Mon, 7 Jun 2021 15:22:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-5-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: BBQO6rX/Fnxb

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Use the recently added generic qtest_has_accel() method to
> check if KVM is available.
> 
> Suggested-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-5-philmd@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 25 +------------------------
>   1 file changed, 1 insertion(+), 24 deletions(-)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 8252b85bb8..7f4b252127 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -26,21 +26,6 @@
>                       "  'arguments': { 'type': 'full', "
>   #define QUERY_TAIL  "}}"
>   
> -static bool kvm_enabled(QTestState *qts)
> -{
> -    QDict *resp, *qdict;
> -    bool enabled;
> -
> -    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
> -    g_assert(qdict_haskey(resp, "return"));
> -    qdict = qdict_get_qdict(resp, "return");
> -    g_assert(qdict_haskey(qdict, "enabled"));
> -    enabled = qdict_get_bool(qdict, "enabled");
> -    qobject_unref(resp);
> -
> -    return enabled;
> -}
> -
>   static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
>   {
>       return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
> @@ -493,14 +478,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>   
>       qts = qtest_init(MACHINE_KVM "-cpu max");
>   
> -    /*
> -     * These tests target the 'host' CPU type, so KVM must be enabled.
> -     */
> -    if (!kvm_enabled(qts)) {
> -        qtest_quit(qts);
> -        return;
> -    }
> -
>       /* Enabling and disabling kvm-no-adjvtime should always work. */
>       assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
>       assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
> @@ -624,7 +601,7 @@ int main(int argc, char **argv)
>        * order avoid attempting to run an AArch32 QEMU with KVM on
>        * AArch64 hosts. That won't work and isn't easy to detect.
>        */
> -    if (g_str_equal(qtest_get_arch(), "aarch64")) {
> +    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
>           qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>                               NULL, test_query_cpu_model_expansion_kvm);

I think this is wrong: query-kvm checks whether kvm is *enabled*, while your 
new function only checks whether kvm has been built into the binary. There 
is still the possibility that kvm has been built into the binary, but is not 
available on the host, so in that case the test will fail now.

Thus please drop / rework this patch.

  Thomas
