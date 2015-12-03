Received: by 10.182.158.201 with SMTP id ww9csp34492obb;
        Thu, 3 Dec 2015 07:44:51 -0800 (PST)
X-Received: by 10.28.47.8 with SMTP id v8mr52226139wmv.30.1449157491112;
        Thu, 03 Dec 2015 07:44:51 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com. [2a00:1450:400c:c09::229])
        by mx.google.com with ESMTPS id c125si10008370wmd.11.2015.12.03.07.44.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Dec 2015 07:44:51 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::229 as permitted sender) client-ip=2a00:1450:400c:c09::229;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::229 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro-org.20150623.gappssmtp.com
Received: by wmuu63 with SMTP id u63so26628482wmu.0
        for <alex.bennee@linaro.org>; Thu, 03 Dec 2015 07:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro-org.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=NdOGruPK8iCao+z0RsoJZQXsTw7IUVt4TdZulfP3HAM=;
        b=k5XEuwwrzzygWdQIc3GJFfuY2RjvbwvcTRyzajymoZPzy3kZLKdyT6912f9r7uGSPL
         miX+yAko8mnAEAHaxFBCjSg+eBBEae9NRNyX0ORZNRRM5BwjJqlBx2e2zol6cqBOI9Y9
         0thfV+xn+QoyW6PR6zZeaIntRdlwBaa/1+wBcpxFFRrodOCXMH8Uq5sKjucJyGkpRLfB
         KpTkEmvZxqBvHeR1a3M5tJzsNdJZiOSkmPL3XrHiMSK7HoKeUPB8/Dy9mLVDc0OuiGEE
         wBu9PiRUR0l4FouDiRgq79Yq8iW0S6ZQ2dBIXVjajKtv4ElM46Jmf5DNsjxEdMol7n+/
         toAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=NdOGruPK8iCao+z0RsoJZQXsTw7IUVt4TdZulfP3HAM=;
        b=F17PfE+4Bmwf9Zsdwlj1DZbG8+CBg+aeKmigrmpxJ/t6t0XaqeouhuLKyENYEwnJAx
         fJ+9o3GMU/9yuD9C+bbVI+PqHwDgZm0mFE9349m//MM7B+BOiZrCdUKfSAbE63obrJte
         QB4/4lhqG9xbBksAKFPsGq3i4GnDXAqvo3qJaK3vLQtAaDJkiNggxXpehbPm3NAVG0rb
         tuCVqDrUIXbN7C/Fo81ap2Dd8SyaSeNVCPBxeZpa7vP/dMYftYvKEd57BId/vMnTrW3u
         IQQCO/3GPJ84Zx0mwI8g1xf80XerIMFQu5gAihgiIPxwGaH+Iv52oLRJMey61P3Wczi9
         vJVQ==
X-Gm-Message-State: ALoCoQn4tc4sx6qS6fs50bOLXJLuFUdmjKd1H5arWTQF/qno3Ade3Yq+z5D2PllNzwMmMBbd60dG
X-Received: by 10.28.158.75 with SMTP id h72mr12997016wme.74.1449157490845;
        Thu, 03 Dec 2015 07:44:50 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id n7sm8449554wmf.21.2015.12.03.07.44.48
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 03 Dec 2015 07:44:49 -0800 (PST)
Subject: Re: [Qemu-devel] [RESEND RFC 3/6] device_tree: introduce
 qemu_fdt_node_path
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
 <1447946528-1533-4-git-send-email-eric.auger@linaro.org>
 <8737vtyngq.fsf@linaro.org>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, peter.maydell@linaro.org,
 thomas.lendacky@amd.com, b.reynal@virtualopensystems.com,
 patches@linaro.org, suravee.suthikulpanit@amd.com, pbonzini@redhat.com,
 christoffer.dall@linaro.org
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56606353.2050108@linaro.org>
Date: Thu, 3 Dec 2015 16:44:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <8737vtyngq.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: LFTVrXYy1KHV

On 11/26/2015 01:06 PM, Alex Bennée wrote:
> 
> Eric Auger <eric.auger@linaro.org> writes:
> 
>> This new helper routine returns the node path of a device
>> referred to by its name and compat string.
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>> ---
>>  device_tree.c                | 40 ++++++++++++++++++++++++++++++++++++++++
>>  include/sysemu/device_tree.h |  3 +++
>>  2 files changed, 43 insertions(+)
>>
>> diff --git a/device_tree.c b/device_tree.c
>> index 58a5329..f184e3c 100644
>> --- a/device_tree.c
>> +++ b/device_tree.c
>> @@ -171,6 +171,46 @@ static int findnode_nofail(void *fdt, const char *node_path)
>>      return offset;
>>  }
>>
>> +/**
>> + * qemu_fdt_node_path
>> + *
>> + * return the node path of a device, referred to by its node name
>> + * and its compat string
>> + * fdt: pointer to the dt blob
>> + * name: name of the device
>> + * compat: compatibility string of the device
>> + *
>> + * returns the node path
>> + */
>> +int qemu_fdt_node_path(void *fdt, const char *name, char *compat,
>> +                       char **node_path)
>> +{
>> +    int offset = 0, len;
>> +    const char *iter_name;
>> +    char path[256];
>> +    int ret;
>> +
>> +    *node_path = NULL;
>> +    while (1) {
>> +        offset = fdt_node_offset_by_compatible(fdt, offset, compat);
>> +        if (offset == -FDT_ERR_NOTFOUND) {
> 
> Is this not the only error code fdt_node_offset_by_compatible() won't
> return?
> 
>> +            break;
>> +        }
>> +        iter_name = fdt_get_name(fdt, offset, &len);
>> +        if (!strncmp(iter_name, name, len)) {
> 
> is it possible for fdt_get_name to fail here and give you NULL and -len?
I agree with both of your comments. Thanks for spotting my wrong
handling of the errors.

Thank you for your time!

Eric
> 
>> +            goto found;
>> +        }
>> +    }
>> +    return offset;
>> +
>> +found:
>> +    ret = fdt_get_path(fdt, offset, path, 256);
>> +    if (!ret) {
>> +        *node_path = g_strdup(path);
>> +    }
>> +    return ret;
>> +}
>> +
>>  int qemu_fdt_setprop(void *fdt, const char *node_path,
>>                       const char *property, const void *val, int size)
>>  {
>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>> index 307e53d..f9e6e6e 100644
>> --- a/include/sysemu/device_tree.h
>> +++ b/include/sysemu/device_tree.h
>> @@ -18,6 +18,9 @@ void *create_device_tree(int *sizep);
>>  void *load_device_tree(const char *filename_path, int *sizep);
>>  void *load_device_tree_from_sysfs(void);
>>
>> +int qemu_fdt_node_path(void *fdt, const char *name, char *compat,
>> +                       char **node_path);
>> +
>>  int qemu_fdt_setprop(void *fdt, const char *node_path,
>>                       const char *property, const void *val, int size);
>>  int qemu_fdt_setprop_cell(void *fdt, const char *node_path,
> 
> 
> --
> Alex Bennée
> 
