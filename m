Received: by 10.25.159.19 with SMTP id i19csp1268908lfe;
        Mon, 25 Jan 2016 06:10:07 -0800 (PST)
X-Received: by 10.28.153.3 with SMTP id b3mr19281163wme.7.1453731007623;
        Mon, 25 Jan 2016 06:10:07 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com. [2a00:1450:400c:c09::229])
        by mx.google.com with ESMTPS id d71si24693843wmi.16.2016.01.25.06.10.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jan 2016 06:10:07 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::229 as permitted sender) client-ip=2a00:1450:400c:c09::229;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::229 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x229.google.com with SMTP id n5so81752083wmn.0
        for <alex.bennee@linaro.org>; Mon, 25 Jan 2016 06:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=A7h8GYrjVJPKzTZ7VaNJMz51WUEI3TBpCK5vsEoa/hg=;
        b=GFmoW911Lb9pHqXCo6XgV2hUkCYA2vK1v0oyvrK2OI3yZSSbmm3fTyYUlDRuh2eh2O
         KMYaJ/E85GJDA7arg6exbpqZyd6ma+apAmUyb3esSMFpM6Af8ol83JmA0RZo8nIiUb85
         p43HZ9Ey/CtbnJtSr1ZCrJpmrvG1snzjOmU44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=A7h8GYrjVJPKzTZ7VaNJMz51WUEI3TBpCK5vsEoa/hg=;
        b=MdDSG+NgLyvTjzhBRVj+/79AeGa169hLzoKB97CAL/2kSthhDInqJAUd7VcdgJ3ZJB
         WX5/iwUuA2NWq33vYvVgaZT2FCpxbhXSspFBZuSVJoYjqZuTdTx/M7CxGROUgN6oO5zp
         3IzXSCANv/wV7pdKREQBK3bBnCyIqjScj7ZVILhOiDDplmy/1Y/3ZtnJn6uf0FADWZ65
         YiPq9jdR16GaYH0U1Br80y1w3Y/YRN7k+H8Gv5uJs+Wn0raxRGCvrR0ZnV5IhDrhcZXZ
         C/6KprnsujetQe6sc38846FMQNIUdxYxQ9jaV3qrKaFNya28EK4YawHuICUV/JkmSt5P
         5FRw==
X-Gm-Message-State: AG10YOQruYpQ2ZFCKnklL5izEeOR4QVdXgGDNPoE4QKYDwZEpb64H7hwe5lkKy+zxJVx674ZBos=
X-Received: by 10.28.218.81 with SMTP id r78mr19245672wmg.91.1453731007337;
        Mon, 25 Jan 2016 06:10:07 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id ka4sm19352486wjc.47.2016.01.25.06.10.04
        (version=TLSv1/SSLv3 cipher=OTHER);
        Mon, 25 Jan 2016 06:10:05 -0800 (PST)
Subject: Re: [PATCH v5 6/8] hw/arm/sysbus-fdt: helpers for clock node
 generation
To: Peter Maydell <peter.maydell@linaro.org>
References: <1453130204-655-1-git-send-email-eric.auger@linaro.org>
 <1453130204-655-7-git-send-email-eric.auger@linaro.org>
 <CAFEAcA9ZximjpaZ_rSdfM1JRyhW9dz1DZfcRRqQR+03heSPg2A@mail.gmail.com>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Peter Crosthwaite <crosthwaitepeter@gmail.com>,
 Patch Tracking <patches@linaro.org>,
 Christoffer Dall <christoffer.dall@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Baptiste Reynal <b.reynal@virtualopensystems.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 thomas.lendacky@amd.com
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56A62CAD.50405@linaro.org>
Date: Mon, 25 Jan 2016 15:09:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ZximjpaZ_rSdfM1JRyhW9dz1DZfcRRqQR+03heSPg2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: E5gx6F4T55Nx

Hi Peter,
On 01/25/2016 03:05 PM, Peter Maydell wrote:
> On 18 January 2016 at 15:16, Eric Auger <eric.auger@linaro.org> wrote:
>> Some passthrough'ed devices depend on clock nodes. Those need to be
>> generated in the guest device tree. This patch introduces some helpers
>> to build a clock node from information retrieved in the host device tree.
>>
>> - copy_properties_from_host copies properties from a host device tree
>>   node to a guest device tree node
>> - fdt_build_clock_node builds a guest clock node and checks the host
>>   fellow clock is a fixed one.
>>
>> fdt_build_clock_node will become static as soon as it gets used. A
>> dummy pre-declaration is needed for compilation of this patch.
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
> 
>> +
>> +/**
>> + * copy_properties_from_host
>> + *
>> + * copies properties listed in an array from host device tree to
>> + * guest device tree. If a non optional property is not found, the
>> + * function self-asserts. An optional property is ignored if not found
> 
> This is just "asserts", not "self-asserts".
ok
> 
>> + * in the host device tree.
>> + * @props: array of HostProperty to copy
>> + * @nb_props: number of properties in the array
>> + * @host_dt: host device tree blob
>> + * @guest_dt: guest device tree blob
>> + * @node_path: host dt node path where the property is supposed to be
>> +              found
>> + * @nodename: guest node name the properties should be added to
>> + */
> 
>> +/**
>> + * fdt_build_clock_node
>> + *
>> + * Build a guest clock node, used as a dependency from a passthrough'ed
>> + * device. Most information are retrieved from the host clock node.
>> + * Also check the host clock is a fixed one.
>> + *
>> + * @host_fdt: host device tree blob from which info are retrieved
>> + * @guest_fdt: guest device tree blob where the clock node is added
>> + * @host_phandle: phandle of the clock in host device tree
>> + * @guest_phandle: phandle to assign to the guest node
>> + */
>> +void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
>> +                         uint32_t host_phandle,
>> +                         uint32_t guest_phandle);
>> +void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
>> +                         uint32_t host_phandle,
>> +                         uint32_t guest_phandle)
>> +{
>> +    char *node_path = NULL;
>> +    char *nodename;
>> +    const void *r;
>> +    int ret, node_offset, prop_len, path_len = 16;
>> +
>> +    node_offset = fdt_node_offset_by_phandle(host_fdt, host_phandle);
>> +    if (node_offset <= 0) {
>> +        error_setg(&error_fatal,
>> +                   "not able to locate clock handle %d in host device tree",
>> +                   host_phandle);
> 
> Don't we want to return here, rather than continuing with the
> rest of the function? ("goto err;" with an err: label before
> the g_free() at the bottom of the function probably best since
> some of the error paths need to free that.)
due to the &error_fatal, we are going to exit here. I thought it is not
worth going further if we can't find the clock node.

Best Regards

Eric
> 
>> +    }
>> +    node_path = g_malloc(path_len);
>> +    while ((ret = fdt_get_path(host_fdt, node_offset, node_path, path_len))
>> +            == -FDT_ERR_NOSPACE) {
>> +        path_len += 16;
>> +        node_path = g_realloc(node_path, path_len);
>> +    }
>> +    if (ret < 0) {
>> +        error_setg(&error_fatal,
>> +                   "not able to retrieve node path for clock handle %d",
>> +                   host_phandle);
>> +    }
>> +
>> +    r = qemu_fdt_getprop(host_fdt, node_path, "compatible", &prop_len,
>> +                         &error_fatal);
>> +    if (strcmp(r, "fixed-clock")) {
>> +        error_setg(&error_fatal,
>> +                   "clock handle %d is not a fixed clock", host_phandle);
>> +    }
>> +
>> +    nodename = strrchr(node_path, '/');
>> +    qemu_fdt_add_subnode(guest_fdt, nodename);
>> +
>> +    copy_properties_from_host(clock_copied_properties,
>> +                              ARRAY_SIZE(clock_copied_properties),
>> +                              host_fdt, guest_fdt,
>> +                              node_path, nodename);
>> +
>> +    qemu_fdt_setprop_cell(guest_fdt, nodename, "phandle", guest_phandle);
>> +
>> +    g_free(node_path);
>> +}
>> +
>>  /* Device Specific Code */
> 
> thanks
> -- PMM
> 
