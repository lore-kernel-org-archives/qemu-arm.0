Received: by 10.25.134.130 with SMTP id i124csp1879783lfd;
        Mon, 11 Jan 2016 02:36:05 -0800 (PST)
X-Received: by 10.28.221.215 with SMTP id u206mr13542018wmg.58.1452508564956;
        Mon, 11 Jan 2016 02:36:04 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22c.google.com (mail-wm0-x22c.google.com. [2a00:1450:400c:c09::22c])
        by mx.google.com with ESMTPS id dc4si197942269wjc.52.2016.01.11.02.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2016 02:36:04 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22c as permitted sender) client-ip=2a00:1450:400c:c09::22c;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22c as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22c.google.com with SMTP id f206so206930745wmf.0
        for <alex.bennee@linaro.org>; Mon, 11 Jan 2016 02:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=2Rrew0f+ZDuCSmXW5wmAbocY9zL9joOZwQJ3hVcKvdo=;
        b=YPh2mT6f1wcLTflxYSNJmGM5adQnCV6vrtu1kW9Um3EI8idc5QnLtssYMK3Cn/k2U1
         5r6TzrYYkrIYj1SCiGs4qIbz+UVLYaWo1VTYkRfL/sjAO7E9PjkXQQoTijjkF7N1oHdj
         SSflyK/ZHy5NgMDO5cfc6Yu9ME90B4LSbt+ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=2Rrew0f+ZDuCSmXW5wmAbocY9zL9joOZwQJ3hVcKvdo=;
        b=Zvk2LaRek19HaFxLXQvy8tn/fkTevsM7G3T2mHm3z0mLxBwhIi9pzvCs5iXwZjqbn4
         EsXbyw/Xq0O+svw7nhMX75KXVHB3ohdhf1EC97iixhPWqC3DB3/PF8mWXzDUa1jXFRBZ
         pqKoxWw1pCNThMi55I/Vn6oNM/kARu10YA/U7QjiX3hWal5tUyA13eAkUVGAKdez4mIf
         HjgbAyrEp9C/9Amzfgr7cuJ2K+FcQ56/Dagj87Wv2sev5BaOw/nZGBXOvkfdDajdBRoA
         cH+ZTyw1IWhEV1rJnMKD/pPP+sEuC8SBlcfhcG8VGq1pbBPgd5yFQWqYOrJ7K/USi5AO
         9tXA==
X-Gm-Message-State: ALoCoQkr8aB2EBgtzcEd+X761MYAbJXR4E7EyTP83LJu9QLZONF/cMLbo9npY4RQGUyz3VkNu0bVA20OpYmXI4qfMLIE1lpTGw==
X-Received: by 10.28.23.5 with SMTP id 5mr13290868wmx.82.1452508564743;
        Mon, 11 Jan 2016 02:36:04 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id v191sm11114576wme.1.2016.01.11.02.36.02
        (version=TLSv1/SSLv3 cipher=OTHER);
        Mon, 11 Jan 2016 02:36:03 -0800 (PST)
Subject: Re: [PATCH v2 3/7] device_tree: introduce qemu_fdt_node_path
To: David Gibson <david@gibson.dropbear.id.au>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
 <1452093205-30167-4-git-send-email-eric.auger@linaro.org>
 <20160111023853.GB22925@voom.redhat.com>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, alex.williamson@redhat.com,
 alex.bennee@linaro.org, thuth@redhat.com, crosthwaitepeter@gmail.com,
 patches@linaro.org, christoffer.dall@linaro.org, pbonzini@redhat.com,
 b.reynal@virtualopensystems.com, suravee.suthikulpanit@amd.com,
 thomas.lendacky@amd.com
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56938586.5050503@linaro.org>
Date: Mon, 11 Jan 2016 11:35:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160111023853.GB22925@voom.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: FTUXvfPO+k5D

Hi David,
On 01/11/2016 03:38 AM, David Gibson wrote:
> On Wed, Jan 06, 2016 at 03:13:21PM +0000, Eric Auger wrote:
>> This new helper routine returns the node path of a device
>> referred to by its node name and compat string.
> 
> What if there are multiple nodes matching the name and compat?
The function would return the first one. I can improve the doc comment.
Do you think it is a problem stopping at the first one? Is it a real
life test case I have to handle here?

Thanks

Eric
> 
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>>
>> ---
>>
>> v1 -> v2:
>> - move doc comment in header file
>> - do not use a fixed size buffer
>> - break on errors in while loop
>> - use strcmp instead of strncmp
>>
>> RFC -> v1:
>> - improve error handling according to Alex' comments
>> ---
>>  device_tree.c                | 37 +++++++++++++++++++++++++++++++++++++
>>  include/sysemu/device_tree.h | 14 ++++++++++++++
>>  2 files changed, 51 insertions(+)
>>
>> diff --git a/device_tree.c b/device_tree.c
>> index b262c2d..8441e01 100644
>> --- a/device_tree.c
>> +++ b/device_tree.c
>> @@ -231,6 +231,43 @@ static int findnode_nofail(void *fdt, const char *node_path)
>>      return offset;
>>  }
>>  
>> +int qemu_fdt_node_path(void *fdt, const char *name, char *compat,
>> +                       char **node_path)
>> +{
>> +    int offset, len, ret;
>> +    const char *iter_name;
>> +    unsigned int path_len = 16;
>> +    char *path;
>> +
>> +    *node_path = NULL;
>> +    offset = fdt_node_offset_by_compatible(fdt, -1, compat);
>> +
>> +    while (offset >= 0) {
>> +        iter_name = fdt_get_name(fdt, offset, &len);
>> +        if (!iter_name) {
>> +            offset = len;
>> +            break;
>> +        }
>> +        if (!strcmp(iter_name, name)) {
>> +            goto found;
>> +        }
>> +        offset = fdt_node_offset_by_compatible(fdt, offset, compat);
>> +    }
>> +    return offset;
>> +
>> +found:
>> +    path = g_malloc(path_len);
>> +    while ((ret = fdt_get_path(fdt, offset, path, path_len))
>> +            == -FDT_ERR_NOSPACE) {
>> +        path_len += 16;
>> +        path = g_realloc(path, path_len);
>> +    }
>> +    if (!ret) {
>> +        *node_path = path;
>> +    }
>> +    return ret;
>> +}
>> +
>>  int qemu_fdt_setprop(void *fdt, const char *node_path,
>>                       const char *property, const void *val, int size)
>>  {
>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>> index fdf25a4..269cb1c 100644
>> --- a/include/sysemu/device_tree.h
>> +++ b/include/sysemu/device_tree.h
>> @@ -20,6 +20,20 @@ void *load_device_tree(const char *filename_path, int *sizep);
>>  void *load_device_tree_from_sysfs(void);
>>  #endif
>>  
>> +/**
>> + * qemu_fdt_node_path: return the node path of a device, given its
>> + * node name and its compat string
>> + * @fdt: pointer to the dt blob
>> + * @name: device node name
>> + * @compat: compatibility string of the device
>> + * @node_path: returned node path
>> + *
>> + * upon success, the path is output at node_path address
>> + * returns 0 on success, < 0 on failure
>> + */
>> +int qemu_fdt_node_path(void *fdt, const char *name, char *compat,
>> +                       char **node_path);
>> +
>>  int qemu_fdt_setprop(void *fdt, const char *node_path,
>>                       const char *property, const void *val, int size);
>>  int qemu_fdt_setprop_cell(void *fdt, const char *node_path,
> 
